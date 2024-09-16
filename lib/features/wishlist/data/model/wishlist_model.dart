import '../../../../core/api/end_ponits.dart';
import '../../domain/entity/wishlisst_entity.dart';

class WishlistModel extends WishlistEntity {
  WishlistModel({
    required super.title,
    required super.price,
    required super.discountPercentage,
    required super.image,
    required super.productId,
  });
  factory WishlistModel.fromMap(data) {
    return WishlistModel(
      title: data[ApiKey.title],
      price: data[ApiKey.price],
      discountPercentage: data[ApiKey.discountPercentage],
      image: data[ApiKey.image],
      productId: data[ApiKey.id],
    );
  }

  @override
  toMap() => {
        ApiKey.title: title,
        ApiKey.price: price,
        ApiKey.discountPercentage: discountPercentage,
        ApiKey.image: image,
        ApiKey.id: productId,
      };
}
