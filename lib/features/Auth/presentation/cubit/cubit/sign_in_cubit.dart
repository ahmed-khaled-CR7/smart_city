import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/entities/user_entity.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;

  SignInCubit({required this.authRepository}) : super(SignInInitial()) {
    debugPrint("SignInCubit created");
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserEntity? user;

  Future<void> signIn() async {
    debugPrint("signIn called");
    final form = formKey.currentState;
    if (form == null) {
      debugPrint("Form state is null");
      return;
    }

    if (!form.validate()) {
      debugPrint("Form validation failed");
      return;
    }

    emit(SignInLoading());
    debugPrint("SignInLoading emitted");

    try {
      final result = await authRepository.signIn(
        nationalId: nationalIdController.text.trim(),
        password: passwordController.text.trim(),
      );

      result.fold(
        (error) {
          debugPrint("SignInFailure: $error");
          emit(SignInFailure(errMessage: error));
        },
        (userEntity) {
          user = userEntity;
          debugPrint("SignInSuccess: user = $userEntity");
          emit(SignInSuccess());
        },
      );
    } catch (e, stack) {
      debugPrint("Exception in signIn: $e");
      debugPrintStack(stackTrace: stack);
      emit(SignInFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    debugPrint("SignInCubit disposed");
    nationalIdController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
