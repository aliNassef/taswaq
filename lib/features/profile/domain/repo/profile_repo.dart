abstract class ProfileRepo {
  Future<void> logout();
  Future<void> checkPass({
    required String oldPassword,
  });
  Future<void> updatePassword({
    required String newPassword,
  });
  void removeUserData();
}
