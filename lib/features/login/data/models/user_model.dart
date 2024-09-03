import 'package:firebase_auth/firebase_auth.dart';
import 'package:taswaq/core/api/end_ponits.dart';

import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.name,
    super.id,
  });

  factory UserModel.fromJson(User user) {
    return UserModel(
      email: user.email,
      name: '',
      id: user.uid,
    );
  }
  @override
  Map<String, dynamic> toMap() => {
        ApiKey.email: email,
        ApiKey.name: name,
        ApiKey.id: id,
      };
}
