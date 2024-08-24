import 'package:taswaq/core/api/end_ponits.dart';

import '../../domain/entity/user_entity.dart';
 
class UserModel extends UserEntity {
  String? refreshToken;
  String? username;
  String? lastName;
  String? gender;

  UserModel({
    super.token,
    this.refreshToken,
    super.id,
    this.username,
    super.email,
    super.firstName,
    this.lastName,
    this.gender,
    super.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json[ApiKey.token] as String?,
        refreshToken: json[ApiKey.refreshToken] as String?,
        id: json[ApiKey.id] as int?,
        username: json[ApiKey.username] as String?,
        email: json[ApiKey.email] as String?,
        firstName: json[ApiKey.firstName] as String?,
        lastName: json[ApiKey.lastName] as String?,
        gender: json[ApiKey.gender] as String?,
        image: json[ApiKey.image] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.token: token,
        ApiKey.refreshToken: refreshToken,
        ApiKey.id: id,
        ApiKey.username: username,
        ApiKey.email: email,
        ApiKey.firstName: firstName,
        ApiKey.lastName: lastName,
        ApiKey.gender: gender,
        ApiKey.image: image,
      };
}
