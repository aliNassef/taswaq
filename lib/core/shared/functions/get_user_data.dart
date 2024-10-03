import 'dart:convert';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/features/login/domain/entity/user_entity.dart';

UserEntity getUserData() {
  UserEntity userEntity = UserEntity.fromJson(
      jsonDecode(CacheHelper().getData(key: ApiKey.userData)));
  return userEntity;
}
