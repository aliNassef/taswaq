import '../../../domain/entities/offer_entity/offer_entity.dart';

class OfferModel {
  final List<String> images ;

  OfferModel({required this.images});

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      images: List<String>.from(json['images']),
    );
  }
  toEntity() => OfferEntity(images: images);
}