abstract class ProfileRepo {
  Future<void> logout();
  Future<void> checkPass({
    required String oldPassword,
  });

  void removeUserData();
}
