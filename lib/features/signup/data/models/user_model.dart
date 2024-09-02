import 'package:firebase_auth/firebase_auth.dart';
import 'package:taswaq/core/api/end_ponits.dart';

import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.name,
    super.id,
  });

  factory UserModel.fromJson(User json) {
    return UserModel(
      email: json.email,
      id: json.uid,
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKey.email: email,
        ApiKey.name: name,
        ApiKey.id: id,
      };
}
