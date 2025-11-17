import 'package:equatable/equatable.dart';
import '../../domain/entities/complaint_entity.dart';

abstract class ComplaintsState extends Equatable {
  const ComplaintsState();

  @override
  List<Object> get props => [];
}

class ComplaintsInitial extends ComplaintsState {}

class ComplaintsLoading extends ComplaintsState {}

class ComplaintsLoaded extends ComplaintsState {
  final List<ComplaintEntity> complaints;
  const ComplaintsLoaded(this.complaints);

  @override
  List<Object> get props => [complaints];
}

class ComplaintsError extends ComplaintsState {
  final String message;
  const ComplaintsError(this.message);

  @override
  List<Object> get props => [message];
}

class ComplaintCreatedSuccess extends ComplaintsState {}

class ComplaintCreationFailed extends ComplaintsState {
  final String message;
  const ComplaintCreationFailed(this.message);

  @override
  List<Object> get props => [message];
}