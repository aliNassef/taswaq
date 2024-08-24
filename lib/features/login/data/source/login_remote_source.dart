import 'package:taswaq/core/api/api_consumer.dart';
 
import '../../../../core/api/end_ponits.dart';
import '../models/user_model.dart';

class LoginRemoteSource {
  final ApiConsumer api;

  const LoginRemoteSource({required this.api});

  Future<UserModel> login(
      {required String name, required String password}) async {
    final response = await api.post(EndPoints.login, data: {
      'username': name,
      'password': password,
    });
    return UserModel.fromJson(response);
  }
}
