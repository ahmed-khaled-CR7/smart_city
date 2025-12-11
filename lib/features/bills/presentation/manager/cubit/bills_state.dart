// lib/features/bills/presentation/manager/cubit/bills_state.dart

part of 'bills_cubit.dart';

@immutable
sealed class BillsState {}

final class BillsInitial extends BillsState {}

final class BillsLoading extends BillsState {}
class BillsLoaded extends BillsState {
  final List<BillModel> bills;
  BillsLoaded({required this.bills});
}
final class BillsError extends BillsState {
  final String message;
  BillsError({required this.message});
}

// تفاصيل الفاتورة
final class BillDetailsLoading extends BillsState {}
final class BillDetailsLoaded extends BillsState {
  final BillEntity bill;
  BillDetailsLoaded({required this.bill});
}
final class BillDetailsError extends BillsState {
  final String message;
  BillDetailsError({required this.message});
}

// دفع الفاتورة
final class BillPaymentLoading extends BillsState {}
final class BillPaymentSuccess extends BillsState {}   // ده اللي بنستخدمه في الـ Dialog
final class BillPaymentError extends BillsState {
  final String message;
  BillPaymentError({required this.message});
}