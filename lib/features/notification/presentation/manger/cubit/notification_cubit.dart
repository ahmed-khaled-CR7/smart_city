import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/notification/domain/repos/notification_repo.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repo;

  NotificationCubit(this.repo) : super(NotificationInitial());

  Future<void> fetchMyNotifications(int citizenId) async {
    if (isClosed) return;
    emit(NotificationLoading());

    try {
      log("📩 Fetching notifications for: $citizenId");

      final notifications = await repo.getMyNotifications(citizenId);

      if (isClosed) return;
      log("✅ Notifications fetched: ${notifications.length}");

      emit(NotificationSuccess(notifications));
    } catch (e, stackTrace) {
      if (isClosed) return;
      log("❌ Notifications Error: $e");
      log("⚠️ STACKTRACE:", error: e, stackTrace: stackTrace);

      emit(NotificationFailure(_extractErrorMessage(e)));
    }
  }

  Future<void> deleteNotification(int id) async {
    final current = state;

    if (current is NotificationSuccess) {
      final updatedList =
          current.notifications.where((n) => n.id != id).toList();

      emit(NotificationSuccess(updatedList));
      emit(NotificationDeleted(' notification deleted '));
    }
  }

  String _extractErrorMessage(dynamic error) {
    final msg = error.toString();

    if (msg.contains("SocketException")) {
      return "Connection error. Please check your internet.";
    }

    if (msg.contains("404")) return "Not found.";
    if (msg.contains("401")) return "Unauthorized.";
    if (msg.contains("500")) return "Server error.";

    return msg.replaceAll("Exception:", "").trim();
  }
}
