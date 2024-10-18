import '../../../../core/api/end_ponits.dart';
import '../../../profile/domain/entity/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.name,
    required super.street,
    required super.phoneNumber,
    required super.city,
    required super.postalCode,
    required super.id,
  });

  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      name: entity.name,
      street: entity.street,
      phoneNumber: entity.phoneNumber,
      city: entity.city,
      postalCode: entity.postalCode,
      id: entity.id,
    );
  }

  
  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map[ApiKey.name] ?? '',
      street: map[ApiKey.street] ?? '',
      phoneNumber: map[ApiKey.phoneNumber] ?? '',
      city: map[ApiKey.city] ?? '',
      postalCode: map[ApiKey.postalCode] ?? '',
      id: map[ApiKey.id] ?? '',
    );
  }
  @override
  toMap() {
    return {
      ApiKey.name: name,
      ApiKey.street: street,
      ApiKey.phoneNumber: phoneNumber,
      ApiKey.city: city,
      ApiKey.postalCode: postalCode,
      ApiKey.id: id,
    };
  }
}
