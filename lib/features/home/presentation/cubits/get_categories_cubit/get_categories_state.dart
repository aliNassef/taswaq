import 'package:equatable/equatable.dart';

class GetCategoriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetCategoriesInitial extends GetCategoriesState {
  @override
  List<Object?> get props => [];
}

final class GetCategoriesLoaded extends GetCategoriesState {
  final List<String> categories;

  GetCategoriesLoaded({required this.categories});
  @override
  List<Object?> get props => [categories];
}

final class GetCategoriesFailure extends GetCategoriesState {
  final String errMessage;
  GetCategoriesFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}

final class GetCategoriesLoading extends GetCategoriesState {
  @override
  List<Object?> get props => [];
}
