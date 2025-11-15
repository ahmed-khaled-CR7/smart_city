// lib/features/profile/presentation/cubit/profile_state.dart

part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {
  @override
  String toString() => runtimeType.toString();
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserEntity user;
  ProfileSuccess(this.user);

  @override
  String toString() => 'ProfileSuccess(user: ${user.name})';
}

final class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure(this.message);

  @override
  String toString() => 'ProfileFailure(message: $message)';
}
