import 'package:taswaq/features/profile/data/source/profile_remote_source.dart';

import '../../domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteSource profileRemoteSource;

  ProfileRepoImpl({required this.profileRemoteSource});
  @override
  Future<void> checkPass({required String oldPassword}) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await profileRemoteSource.logout();
  }
}
