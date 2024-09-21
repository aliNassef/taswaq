import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/profile/domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;

  Future<void> logout() async {
    await _profileRepo.logout();
    emit(ProfileLogoutSuccess());
  }
}
