import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/profile/domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  Future<void> logout() async {
    await _profileRepo.logout();
    emit(ProfileLogoutSuccess());
  }

  Future<void> checkPass({required String oldPassword}) async {
    await _profileRepo.checkPass(oldPassword: oldPassword);
    emit(ProfileCheckPassSuccess());
  }
}
