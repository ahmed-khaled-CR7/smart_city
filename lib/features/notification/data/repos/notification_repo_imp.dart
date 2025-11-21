import 'package:flutter/material.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_ponits.dart';
import 'package:smart_city/features/notification/data/models/notification_model.dart';
import 'package:smart_city/features/notification/domain/entities/notification_entity.dart';
import 'package:smart_city/features/notification/domain/repos/notification_repo.dart';

class NotificationRepoImp implements NotificationRepository {
  final ApiConsumer api;

  NotificationRepoImp({required this.api});

  @override
  Future<List<NotificationEntity>> getMyNotifications(int citizenId) async {
    try {
      final dynamic response = await api.get(
        EndPoints.myNotifications(citizenId),
        requireAuth: true,
      );

      final List<dynamic> list =
          (response is Map<String, dynamic>)
              ? (response['data'] as List<dynamic>? ?? [])
              : (response is List ? response : []);

      return list
          .map(
            (json) => NotificationModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      debugPrint('Notification Repo Error: $e');
      rethrow;
    }
  }
}
