import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/bills/data/models/bill_model.dart';
import 'package:smart_city/features/bills/domain/entities/bill_entity.dart';
import 'package:smart_city/features/bills/domain/repositories/bills_repo.dart';

class BillsCubit extends Cubit<BillsState> {
  final BillsRepository repo;
  BillsCubit(this.repo) : super(BillsInitial());

  Future<void> loadBills(int citizenId) async {
    emit(BillsLoading());
    final result = await repo.getMyBills(citizenId);
    result.fold(
      (err) => emit(BillsError(err)),
      (data) => emit(BillsLoaded(data)),
    );
  }

  Future<void> pay(int id) async {
    emit(BillPayLoading());
    final result = await repo.payBill(id);
    result.fold(
      (err) => emit(BillPayError(err)),
      (_) {
        final current = state;
        if (current is BillsLoaded) {
          final updated = current.bills.map((b) {
            return (b.id == id) ? (b as BillModel).copyWith(isPaid: true) : b;
          }).toList();

          emit(BillsLoaded(updated));
        }
      },
    );
  }
}


abstract class BillsState {}

class BillsInitial extends BillsState {}
class BillsLoading extends BillsState {}
class BillsLoaded extends BillsState {
  final List<BillEntity> bills;
  BillsLoaded(this.bills);
}
class BillsError extends BillsState {
  final String msg;
  BillsError(this.msg);
}

class BillPayLoading extends BillsState {}
class BillPayError extends BillsState {
  final String msg;
  BillPayError(this.msg);
}
