import 'dart:convert';
import '../../api/end_ponits.dart';
import '../../cache/cache_helper.dart';
import '../../../features/login/domain/entity/user_entity.dart';

UserEntity getUserData() {
  UserEntity userEntity = UserEntity.fromJson(
      jsonDecode(CacheHelper().getData(key: ApiKey.userData)));
  return userEntity;
}
