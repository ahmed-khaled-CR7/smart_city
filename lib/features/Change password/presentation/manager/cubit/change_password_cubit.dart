// lib/features/auth/presentation/cubit/change_password_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/Change%20password/domain/entities/change_pass_entity.dart';
import 'package:smart_city/features/Change%20password/domain/repos/change_pass_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.repo}) : super(ChangePasswordInitial());

  final ChangePasswordRepo repo;

  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  Future<void> changePassword() async {
    emit(ChangePasswordLoading());

    final oldPass = oldPassController.text.trim();
    final newPass = newPassController.text.trim();
    final confirmPass = confirmPassController.text.trim();

    if (newPass != confirmPass) {
      emit(ChangePasswordFailure('password does not match'));
      return;
    }

    if (newPass.length < 6) {
      emit(ChangePasswordFailure('password must be 6 letters at least'));
      return;
    }

    final result = await repo.changePassword(
      ChangePasswordEntity(oldPassword: oldPass, newPassword: newPass),
    );

    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.message)),
      (_) => emit(ChangePasswordSuccess()),
    );
  }

  @override
  Future<void> close() {
    oldPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    return super.close();
  }
}
