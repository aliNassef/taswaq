import 'package:taswaq/core/services/database_service.dart';
import 'package:taswaq/core/shared/functions/get_user_data.dart';
import 'package:taswaq/features/checkout/data/model/address_model.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../profile/domain/entity/address_entity.dart';
import '../model/order_model.dart';

class CheckoutRemoteSource {
  final DatabaseService databaseService;
  const CheckoutRemoteSource({required this.databaseService});

  Future<void> addAddress({required AddressEntity address}) async {
    await databaseService.addToSubCollection(
      docId: getUserData().id!,
      subCollectionName: EndPoints.address,
      path: EndPoints.users,
      data: AddressModel.fromEntity(address).toMap(),
    );
  }

  Future<AddressModel> getAddress() async {
    final response = await databaseService.getSubCollectionData(
      path: EndPoints.users,
      subCollectionName: EndPoints.address,
      docId: getUserData().id!,
    );

    return AddressModel.fromMap(response.first);
  }

  Future<void> addOrder({required OrderModel order}) async {
    await databaseService.addToSubCollection(
      docId: getUserData().id!,
      subCollectionName: EndPoints.orders,
      path: EndPoints.users,
      data: {},
    );
  }
}
