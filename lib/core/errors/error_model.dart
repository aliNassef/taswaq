class ErrorModel {
  final String errorMessage;

  ErrorModel({required this.errorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData["message"],
    );
  }
}
