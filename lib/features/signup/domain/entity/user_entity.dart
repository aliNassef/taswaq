import '../../../../core/api/end_ponits.dart';

class UserEntity {
  final String? email;
  final String? name;
  final String? id;

  const UserEntity({
    this.email,
    this.id,
    this.name,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        email: json[ApiKey.email] as String?,
        id: json[ApiKey.id] as String?,
        name: json[ApiKey.name] as String?,
      );

  toMap() => {
        ApiKey.email: email,
        ApiKey.name: name,
        ApiKey.id: id,
      };
}
