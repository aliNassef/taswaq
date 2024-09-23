part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLogoutSuccess extends ProfileState {}
final class ProfileCheckPassSuccess extends ProfileState {}