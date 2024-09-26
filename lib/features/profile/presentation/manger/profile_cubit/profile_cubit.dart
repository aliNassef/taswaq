import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/profile/domain/repo/profile_repo.dart';

import '../../../domain/entity/privacy_entity.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();
  Future<void> logout() async {
    await _profileRepo.logout();
    emit(ProfileLogoutSuccess());
  }

  Future<void> checkPass({required String oldPassword}) async {
    try {
      await _profileRepo.checkPass(oldPassword: oldPassword);
      emit(ProfileCheckPassSuccess());
    } catch (e) {
      emit(ProfileCheckPassFailure(errMessage: e.toString()));
    }
  }

  Future<void> updateUserPassword({required String newPassword}) async {
    await _profileRepo.updatePassword(newPassword: newPassword);
    emit(ProfileUpdatePasswordSuccess());
  }

  Future<void> getPrivacyData() async {
    emit(ProfilePrivacyDataLoading());
    final result = await _profileRepo.getPrivacyData();
    result.fold(
      (error) => emit(
        ProfilePrivacyDataFailure(errMessage: error.errMessage),
      ),
      (data) => emit(
        ProfilePrivacyDataSuccess(privacyData: data),
      ),
    );
  }
}
