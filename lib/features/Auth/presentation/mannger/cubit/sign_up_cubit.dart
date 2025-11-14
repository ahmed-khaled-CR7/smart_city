// lib/features/auth/presentation/cubit/sign_up_cubit.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;

  SignUpCubit({required this.authRepository}) : super(SignUpInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> signUp() async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      emit(SignUpFailure(errMessage: 'Passwords do not match'));
      return;
    }

    emit(SignUpLoading());

    final result = await authRepository.signUp(
      name: nameController.text.trim(),
      nationalId: nationalIdController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      address: addressController.text.trim(),
    );

    result.fold(
      (error) {
        print('SIGNUP ERROR: $error');
        emit(SignUpFailure(errMessage: error));
      },
      (userEntity) {
        print('SIGNUP SUCCESS: Token saved');
        emit(SignUpSuccess(message: 'Sign up successful'));
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    nationalIdController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
    return super.close();
  }
}
