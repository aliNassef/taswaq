import 'package:firebase_auth/firebase_auth.dart';
import 'package:taswaq/core/api/end_ponits.dart';

import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.name,
    super.id,
  });
  factory UserModel.fromMap(User user) {
    return UserModel(
      email: user.email,
      name: user.displayName,
      id: user.uid,
    );
  }

  factory UserModel.fromJson(user) {
    return UserModel(
      email: user[ApiKey.email],
      name: user[ApiKey.name],
      id: user[ApiKey.id],
    );
  }
  @override
  Map<String, dynamic> toMap() => {
        ApiKey.email: email,
        ApiKey.name: name,
        ApiKey.id: id,
      };
}
