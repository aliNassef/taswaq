part of 'get_search_result_cubit.dart';

@immutable
sealed class GetSearchResultState {}

final class GetSearchResultInitial extends GetSearchResultState {}

final class GetSearchResultLoading extends GetSearchResultState {}

final class GetSearchResultLoaded extends GetSearchResultState {
  final List<SearchEntity> products;

  GetSearchResultLoaded({required this.products});
}

final class GetSearchResultFailure extends GetSearchResultState {
  final String errMessage;

  GetSearchResultFailure({required this.errMessage});
}
