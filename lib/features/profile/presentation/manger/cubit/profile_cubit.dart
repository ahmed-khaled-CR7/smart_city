// lib/features/profile/presentation/cubit/profile_cubit.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/entities/user_entity.dart';
import 'package:smart_city/features/profile/domain/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitial()) {
    debugPrint('ProfileCubit: Initialized');
  }

  Future<void> fetchUser() async {
    debugPrint('ProfileCubit: fetchUser() called');

    emit(ProfileLoading());
    debugPrint('ProfileCubit: Emitted ProfileLoading');

    try {
      final result = await profileRepo.getCurrentUser();
      debugPrint('ProfileCubit: getCurrentUser() result received');

      result.fold(
        (failure) {
          debugPrint('ProfileCubit: Failed to fetch user → ${failure.message}');
          emit(ProfileFailure(failure.message));
        },
        (user) {
          debugPrint(
            'ProfileCubit: User fetched successfully → ${user.name} (${user.email})',
          );
          emit(ProfileSuccess(user));
        },
      );
    } catch (e, stack) {
      debugPrint('ProfileCubit: Exception in fetchUser(): $e');
      debugPrintStack(stackTrace: stack);
      emit(ProfileFailure('Unexpected error: $e'));
    }
  }

  @override
  void onChange(Change<ProfileState> change) {
    super.onChange(change);
    debugPrint(
      'ProfileCubit → Change { '
      'currentState: ${change.currentState.runtimeType}, '
      'nextState: ${change.nextState.runtimeType} '
      '}',
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('ProfileCubit → Error: $error');
    debugPrintStack(stackTrace: stackTrace);
    super.onError(error, stackTrace);
  }
}
