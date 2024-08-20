
import 'package:taswaq/core/api/end_ponits.dart';

class ReviewsEntity {
  final num rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const ReviewsEntity({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewsEntity.fromJson(Map<String, dynamic> json) {
    return ReviewsEntity(
      rating: json[ApiKey.rating],
      comment: json[ApiKey.comment],
      date: json[ApiKey.date],
      reviewerName: json[ApiKey.reviewerName],
      reviewerEmail: json[ApiKey.reviewerEmail],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.rating: rating,
      ApiKey.comment: comment,
      ApiKey.date: date,
      ApiKey.reviewerName: reviewerName,
      ApiKey.reviewerEmail: reviewerEmail,
    };
  }
}
