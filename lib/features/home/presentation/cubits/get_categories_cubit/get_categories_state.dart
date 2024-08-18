class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

final class GetCategoriesLoaded extends GetCategoriesState {
  final List<String> categories;

  GetCategoriesLoaded({required this.categories});
}

final class GetCategoriesFailure extends GetCategoriesState {
  final String errMessage;

  GetCategoriesFailure({required this.errMessage});
}

final class GetCategoriesLoading extends GetCategoriesState {}
