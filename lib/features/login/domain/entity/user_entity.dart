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

  factory UserEntity.fromJson(user) => UserEntity(
        email: user[ApiKey.email],
        id: user[ApiKey.id],
        name: user[ApiKey.name],
      );

  toMap() => {
        ApiKey.email: email,
        ApiKey.name: name,
        ApiKey.id: id,
      };
}
