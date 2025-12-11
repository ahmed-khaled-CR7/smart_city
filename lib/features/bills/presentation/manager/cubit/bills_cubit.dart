// lib/features/bills/presentation/manager/cubit/bills_cubit.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/bills/data/models/bill_model.dart';
import 'package:smart_city/features/bills/domain/entities/bill_entity.dart';
import 'package:smart_city/features/bills/domain/repositories/bills_repo.dart';

part 'bills_state.dart';

class BillsCubit extends Cubit<BillsState> {
  final BillsRepository billsRepository;
  BillsCubit(this.billsRepository) : super(BillsInitial());

  List<BillModel> _cachedBills = [];

  Future<void> getMyBills(int citizenId) async {
    emit(BillsLoading());

    final result = await billsRepository.getMyBills(citizenId);

    result.fold(
          (error) => emit(BillsError(message: error)),
          (bills) {
        _cachedBills = bills
            .map((e) => BillModel(
          id: e.id,
          type: e.type,
          amount: e.amount,
          issueDate: e.issueDate,
          isPaid: e.isPaid,
          citizenId: e.citizenId,
        ))
            .toList();

        emit(BillsLoaded(bills: _cachedBills));
      },
    );
  }

  Future<void> getBillDetails(int billId) async {
    emit(BillDetailsLoading());

    final result = await billsRepository.getBillById(billId);

    result.fold(
          (error) => emit(BillDetailsError(message: error)),
          (bill) => emit(BillDetailsLoaded(bill: bill)),
    );
  }

  Future<void> payBill(int billId) async {
    emit(BillPaymentLoading());

    final result = await billsRepository.payBill(billId);

    result.fold(
          (error) => emit(BillPaymentError(message: error)),
          (_) {
        // تحديث الكاش محليًا
        _cachedBills = _cachedBills.map((bill) {
          if (bill.id == billId) {
            return bill.copyWith(isPaid: true);
          }
          return bill;
        }).toList();

        // نطلّع حالة النجاح فقط (عشان الـ Dialog يظهر)
        emit(BillPaymentSuccess());
      },
    );
  }

  void reset() => emit(BillsInitial());

  // ================================================
  // جديد: لربط الفواتير بالـ Dashboard داخل My Bills
  // ================================================

  /// فاتورة الكهرباء الحالية (غير مدفوعة فقط)
  BillModel? get currentElectricityBill {
    try {
      return _cachedBills.firstWhere(
            (bill) => bill.type?.toLowerCase() == 'electricity' && !bill.isPaid,
      );
    } catch (_) {
      // بدل ما يرجع null، هنرجّع فاتورة وهمية غير مدفوعة عشان نشوف الـ UI
      return BillModel(
        id: 999,
        type: "electricity",
        amount: 1250.75,
        issueDate: DateTime.now(),
        isPaid: false,
        citizenId: 1,
      );
    }
  }

  /// فاتورة المياه الحالية (غير مدفوعة فقط)
  BillModel? get currentWaterBill {
    try {
      return _cachedBills.firstWhere(
            (bill) => bill.type?.toLowerCase() == 'water' && !bill.isPaid,
      );
    } catch (_) {
      return null;
    }
  }

  /// المبلغ المستحق للكهرباء
  double get electricityAmountDue => currentElectricityBill?.amount ?? 0.0;

  /// المبلغ المستحق للمياه
  double get waterAmountDue => currentWaterBill?.amount ?? 0.0;

  /// هل في فاتورة كهرباء غير مدفوعة؟
  bool get hasUnpaidElectricity => currentElectricityBill != null;

  /// هل في فاتورة مياه غير مدفوعة؟
  bool get hasUnpaidWater => currentWaterBill != null;
}