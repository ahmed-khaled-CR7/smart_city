// lib/features/auth/domain/entities/user_entity.dart

class UserEntity {
  final int id;
  final String name;
  final String nationalId;
  final String email;
  final String phone;
  final String address;
  final String role;
  final String createdAt;
  final bool isActive;
  final String? token;

  const UserEntity({
    required this.id,
    required this.name,
    required this.nationalId,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    required this.createdAt,
    required this.isActive,
    this.token,
  });

  // debugging
  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, token: ${token?.substring(0, 10)}...)';
  }
}
