class UpdateUserDto {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;

  UpdateUserDto({this.name, this.email, this.phone, this.address});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) map['name'] = name;
    if (email != null) map['email'] = email;
    if (phone != null) map['phone'] = phone;
    if (address != null) map['address'] = address;
    return map;
  }
}
