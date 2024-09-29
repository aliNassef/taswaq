part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLogoutSuccess extends ProfileState {}

final class ProfileCheckPassSuccess extends ProfileState {}

final class ProfileCheckPassFailure extends ProfileState {
  final String errMessage;

  ProfileCheckPassFailure({required this.errMessage});
}

final class ProfileUpdatePasswordSuccess extends ProfileState {}

final class ProfileUpdatePasswordFailure extends ProfileState {
  final String errMessage;

  ProfileUpdatePasswordFailure({required this.errMessage});
}

final class ProfilePrivacyDataLoading extends ProfileState {}

final class ProfilePrivacyDataFailure extends ProfileState {
  final String errMessage;

  ProfilePrivacyDataFailure({required this.errMessage});
}

final class ProfilePrivacyDataSuccess extends ProfileState {
  final PrivacyEntity privacyData;

  ProfilePrivacyDataSuccess({required this.privacyData});
}

final class ProfileTermsDataLoading extends ProfileState {}

final class ProfileTermsDataSuccess extends ProfileState {
  final TermsEntity entity;

  ProfileTermsDataSuccess({required this.entity});
}

final class ProfileTermsDataFailure extends ProfileState {
  final String errMessage;

  ProfileTermsDataFailure({required this.errMessage});
}
