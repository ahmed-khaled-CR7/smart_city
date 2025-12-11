import 'package:smart_city/core/database/api/end_points.dart';

class ChangePasswordEntity {
  final String oldPassword;
  final String newPassword;

  ChangePasswordEntity({required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toJson() {
    return {ApiKey.oldPassword: oldPassword, ApiKey.newPassword: newPassword};
  }
}
