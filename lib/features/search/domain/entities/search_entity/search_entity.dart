import 'package:taswaq/core/api/end_ponits.dart';

class SearchEntity {
  final String? title;
  final String? thumbnail;
  final double? price;

  const SearchEntity({
    this.title,
    this.thumbnail,
    this.price,
  });

  factory SearchEntity.fromJson(Map<String, dynamic> json) {
    return SearchEntity(
      title: json[ApiKey.title],
      thumbnail: json[ApiKey.thumbnail],
      price: json[ApiKey.price],
    );
  }
}
