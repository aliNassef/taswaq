import '../../../../../core/api/end_ponits.dart';

class Review {
  int? rating;
  String? comment;
  DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json[ApiKey.rating] as int?,
        comment: json[ApiKey.comment] as String?,
        date: json[ApiKey.date] == null
            ? null
            : DateTime.parse(json[ApiKey.date] as String),
        reviewerName: json[ApiKey.reviewerName] as String?,
        reviewerEmail: json[ApiKey.reviewerEmail] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.rating: rating,
        ApiKey.comment: comment,
        ApiKey.date: date?.toIso8601String(),
        ApiKey.reviewerName: reviewerName,
        ApiKey.reviewerEmail: reviewerEmail,
      };
}
