import 'package:firebase_auth/firebase_auth.dart';
import 'package:taswaq/core/api/end_ponits.dart';

class UserEntity {
  final String? email;
  final String? name;
  final String? id;

  const UserEntity({
    this.email,
    this.id,
    this.name,
  });

  factory UserEntity.fromJson(User user) => UserEntity(
        email: user.email,
        id: user.uid,
        name: '',
      );

  toMap() => {
        ApiKey.email: email,
        ApiKey.name: name,
        ApiKey.id: id,
      };
}
