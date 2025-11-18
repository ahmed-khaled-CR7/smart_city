import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/entities/user_entity.dart';
import 'package:smart_city/core/helper/secure_storage_helper.dart';
import 'package:smart_city/features/Auth/presentation/views/login_view.dart';
import 'package:smart_city/features/profile/domain/repos/profile_repo.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  UserEntity? currentUser;

  ProfileCubit(this.profileRepo) : super(ProfileInitial()) {
    debugPrint('ProfileCubit: Initialized');
  }

  Future<void> fetchUser() async {
    if (isClosed) return;
    emit(ProfileLoading());
    try {
      final result = await profileRepo.getCurrentUser();
      if (isClosed) return;

      result.fold(
        (failure) {
          if (!isClosed) emit(ProfileFailure(failure.message));
        },
        (user) {
          currentUser = user;
          if (!isClosed) emit(ProfileSuccess(user));
        },
      );
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      if (!isClosed) emit(ProfileFailure('Unexpected error: $e'));
    }
  }

  void clear() {
    currentUser = null;
    if (!isClosed) emit(ProfileInitial());
  }

  Future<void> logout(BuildContext context) async {
    await SecureStorageHelper.deleteToken();
    currentUser = null;
    if (!isClosed) emit(ProfileInitial());

    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginView.routeName,
      (route) => false,
    );
  }

  @override
  void onChange(Change<ProfileState> change) {
    super.onChange(change);
    debugPrint(
      'ProfileCubit → ${change.currentState.runtimeType} → ${change.nextState.runtimeType}',
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('ProfileCubit Error: $error');
    super.onError(error, stackTrace);
  }
}
