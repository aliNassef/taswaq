import 'package:taswaq/core/api/end_ponits.dart';

class UserEntity {
  final String? email;
  final String? firstName;
  final String? image;
  final int? id;
  final String? token;

  const UserEntity({
    this.email,
    this.firstName,
    this.image,
    this.id,
    this.token,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        email: json[ApiKey.email] as String?,
        firstName: json[ApiKey.firstName] as String?,
        image: json[ApiKey.image] as String?,
        id: json[ApiKey.id] as int?,
        token: json[ApiKey.token] as String?,
      );
}
