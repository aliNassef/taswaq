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
