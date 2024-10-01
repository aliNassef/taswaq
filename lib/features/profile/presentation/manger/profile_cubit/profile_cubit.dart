import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/profile/domain/entity/address_entity.dart';
import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../domain/entity/terms_entity.dart';
import '../../../domain/repo/profile_repo.dart';

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

  Future<void> getTermsAndConditions() async {
    emit(ProfilePrivacyDataLoading());
    final result = await _profileRepo.getTermsData();
    result.fold(
      (error) => emit(
        ProfileTermsDataFailure(errMessage: error.errMessage),
      ),
      (data) => emit(
        ProfileTermsDataSuccess(entity: data),
      ),
    );
  }

  // controllers for shipping address
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  Future<void> addUserAddress() async {
    try {
      String id = getIt<CacheHelper>().getData(key: ApiKey.userId);
      var data = AddressEntity(
        name: fullName.text,
        street: streetName.text,
        phoneNumber: phoneNumber.text,
        city: city.text,
        postalCode: postalCode.text,
        id: id,
      );
      await _profileRepo.addUserAddress(data: data);
      emit(AddUserAddressSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddUserAddressFailure(errMessage: e.toString()));
    }
  }
}
