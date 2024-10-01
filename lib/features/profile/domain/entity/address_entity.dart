import '../../../../core/api/end_ponits.dart';

class AddressEntity {
  final String name;
  final String street;
  final String phoneNumber;
  final String city;
  final String postalCode;
  final String id;
  const AddressEntity({
    required this.name,
    required this.street,
    required this.phoneNumber,
    required this.city,
    required this.postalCode,
    required this.id,
  });

  Map<String, dynamic> toMap() {
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
