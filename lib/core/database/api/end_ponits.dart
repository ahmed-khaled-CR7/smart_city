// lib/core/database/api/end_ponits.dart

class EndPoints {
  static const String baseUrl = "http://smartcity.tryasp.net/";

  // ── Authentication
  static const String register = "/api/Authentication/register";
  static const String login = "/api/Authentication/login";
  static const String changePassword = "/api/Authentication/change-password";

  // ── User
  static const String me = "api/users/me";

  // ── Bills (Citizen)
  static const String myBills = "/api/bills/my-bills/{citizenId}";
  static const String billDetail = "/api/bills/{id}";
  static const String payBill = "/api/bills/{id}/pay";

  // ── Complaints
  static const String createComplaint = "/api/complaints?citizenId={citizenId}";
  static const String myComplaints = "/api/complaints/my/{citizenId}";

  // ── Suggestions
  static const String suggestions = "/api/Suggestions";
  static const String suggestionDetail = "/api/Suggestions/{id}";
  static const String createSuggestion = "/api/Suggestions";
  static const String updateSuggestion = "/api/Suggestions/{id}";
  static const String deleteSuggestion = "/api/Suggestions/{id}";

  // ── Notifications
  static const String myNotifications = "/api/Notification/my/{citizenId}";
}

class ApiKey {
  // ── Auth
  static const String name = "name";
  static const String nationalId = "nationalId";
  static const String email = "email";
  static const String phone = "phone";
  static const String password = "password";
  static const String address = "address";
  static const String oldPassword = "oldPassword";
  static const String newPassword = "newPassword";

  // ── Token
  static const String token = "token";
  static const String status = "status";

  // ── User
  static const String id = "id";
  static const String role = "role";
  static const String createdAt = "createdAt";
  static const String isActive = "isActive";

  // ── Complaints
  static const String title = "title";
  static const String description = "description";
  static const String location = "location";
  static const String imageUrl = "imageUrl";
  static const String dateSubmitted = "dateSubmitted";
  static const String updatedAt = "updatedAt";
  static const String statusCode = "status";
  static const String citizenId = "citizenId";
  static const String adminId = "adminId";
  static const String adminNote = "adminNote";

  // ── Bill
  static const String amount = "amount";
  static const String issueDate = "issueDate";
  static const String isPaid = "isPaid";
  static const String type = "type";

  // ── Suggestion
  static const String suggestionTitle = "title";
  static const String suggestionDescription = "description";
  static const String suggestionStatus = "status";

  // ── Utility Issue
  static const String utilityType = "type"; //
  static const String reportDate = "reportDate";
}
