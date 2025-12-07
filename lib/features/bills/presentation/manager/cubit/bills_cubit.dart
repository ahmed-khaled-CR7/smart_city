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

    result.fold((error) => emit(BillsError(message: error)), (bills) {
      _cachedBills =
          bills
              .map(
                (e) => BillModel(
                  id: e.id,
                  type: e.type,
                  amount: e.amount,
                  issueDate: e.issueDate,
                  isPaid: e.isPaid,
                  citizenId: e.citizenId,
                ),
              )
              .toList();

      emit(BillsLoaded(bills: _cachedBills));
    });
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

    result.fold((error) => emit(BillPaymentError(message: error)), (_) {
      emit(BillPaymentSuccess());

      _cachedBills =
          _cachedBills.map((bill) {
            if (bill.id == billId) {
              return bill.copyWith(isPaid: true);
            }
            return bill;
          }).toList();

      emit(BillsLoaded(bills: _cachedBills));
    });
  }

  void reset() => emit(BillsInitial());
}
