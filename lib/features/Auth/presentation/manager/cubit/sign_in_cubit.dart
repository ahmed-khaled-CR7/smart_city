// lib/features/auth/presentation/cubit/sign_in_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/secure_storage_helper.dart';
import 'package:smart_city/core/entities/user_entity.dart';
import 'package:smart_city/features/Auth/domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;

  SignInCubit({required this.authRepository}) : super(SignInInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserEntity? user;

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;

    emit(SignInLoading());

    final result = await authRepository.signIn(
      nationalId: nationalIdController.text.trim(),
      password: passwordController.text.trim(),
    );

    result.fold(
      (error) {
        emit(SignInFailure(errMessage: error));
      },
      (userEntity) async {
        user = userEntity;
        final token = userEntity.token;

        if (token != null && token.isNotEmpty) {
          await SecureStorageHelper.saveToken(token);
        }

        emit(SignInSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    nationalIdController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
