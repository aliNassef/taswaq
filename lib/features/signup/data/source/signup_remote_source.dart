import 'package:taswaq/core/api/api_consumer.dart';
import 'package:taswaq/features/signup/data/models/user_model.dart';

import '../../../../core/api/end_ponits.dart';

class SignupRemoteSource {
  final ApiConsumer api;

  const SignupRemoteSource({required this.api});

  Future<UserModel> signup(
      {required String name, required String password}) async {
    final response = await api.post(EndPoints.signup, data: {
      'username': name,
      'password': password,
    });
    return UserModel.fromJson(response);
  }
}
