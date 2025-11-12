// lib/core/databases/api/end_points.dart

class EndPoints {
  // Base URL
  static const String baseUrl = "https://smartcity.tryasp.net/";
  // Auth
  static const String register = "api/Authentication/register";
  static const String login = "api/Authentication/login";
  static const String changePassword = "api/Authentication/change-password";

  // user
  static const String getMe = "api/users/me";

  // Bills
  static const String myBills = "api/bills/my-bills";
  static const String billDetails = "api/bills";
  static const String payBill = "api/bills";

  // Complaints
  static const String createComplaint = "api/complaints";
  static const String myComplaints = "api/complaints/my";

  // Suggestions
  static const String suggestions = "api/Suggestions";
  static const String suggestionDetails = "api/Suggestions";

  // Notifications
  static const String myNotifications = "api/Notification/my";
}

class ApiKey {
  // Common
  static const String id = "id";
  static const String token = "token";
  static const String message = "message";
  static const String status = "status";

  // User
  static const String name = "name";
  static const String nationalId = "nationalId";
  static const String email = "email";
  static const String phone = "phone";
  static const String address = "address";
  static const String role = "role";
  static const String createdAt = "createdAt";
  static const String isActive = "isActive";

  // Bill
  static const String type = "type";
  static const String amount = "amount";
  static const String issueDate = "issueDate";
  static const String isPaid = "isPaid";
  static const String citizenId = "citizenId";

  // Complaint
  static const String title = "title";
  static const String description = "description";
  static const String dateSubmitted = "dateSubmitted";
  static const String updatedAt = "updatedAt";
  static const String location = "location";
  static const String imageUrl = "imageUrl";
  static const String adminId = "adminId";
  static const String adminNote = "adminNote";

  // Suggestion
  static const String suggestionStatus = "status";

  // Utility
  static const String utilityType = "type";
  static const String reportDate = "reportDate";
}
