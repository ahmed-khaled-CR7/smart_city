// lib/core/database/api/end_points.dart

class EndPoints {
  static const String baseUrl = "http://smartcity.tryasp.net";

  // Auth
  static const String register = "/api/Authentication/register";
  static const String login = "/api/Authentication/login";
  static const String changePassword = "/api/Authentication/change-password";

  static const String me = "/api/users/me";

  // Bills
  static String myBills(int citizenId) => "/api/bills/my-bills/$citizenId";
  static String billDetail(int id) => "/api/bills/$id";
  static String payBill(int id) => "/api/bills/$id/pay";

  // Complaints
  static String createComplaint(int citizenId) =>
      "/api/complaints?citizenId=$citizenId";

  /// MUST TAKE citizenId
  static String myComplaints(int citizenId) =>
      "/api/complaints/my/$citizenId";

  // Suggestions
  static const String suggestionsList = "/api/Suggestions";
  static String suggestionDetail(int id) => "/api/Suggestions/$id";
  static const String createSuggestion = "/api/Suggestions";
  static String updateSuggestion(int id) => "/api/Suggestions/$id";
  static String deleteSuggestion(int id) => "/api/Suggestions/$id";

  // Notifications
  static String myNotifications(int citizenId) =>
      "/api/Notification/my/$citizenId";
}

/// ------------------------------
/// ApiKey: keys used inside requests / payloads / local storage keys
/// ------------------------------
class ApiKey {
  // token key used in local storage/cache and header retrieval
  static const String token = "token";

  // auth / profile keys (used in some DTOs/entities)
  static const String name = "name";
  static const String nationalId = "nationalId";
  static const String email = "email";
  static const String phone = "phone";
  static const String password = "password";
  static const String address = "address";

  // change password keys (used by change password dto/entity)
  static const String oldPassword = "oldPassword";
  static const String newPassword = "newPassword";

  // complaints keys (if you need them later)
  static const String title = "title";
  static const String description = "description";
  static const String location = "location";
  static const String imageUrl = "imageUrl";
  static const String dateSubmitted = "dateSubmitted";
  static const String statusCode = "status";
  static const String citizenId = "citizenId";

  // other keys...
}
