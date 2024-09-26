import '../../../../core/api/end_ponits.dart';
import '../../domain/entity/privacy_entity.dart';

class PrivacyModel extends PrivacyEntity {
  PrivacyModel({
    super.ourPolicy,
    super.collectionInfo,
    super.useInfo,
    super.sharingInfo,
    super.dataSecurity,
    super.userRights,
    super.childrenPrivacy,
    super.updatesPrivacy,
  });

  factory PrivacyModel.fromMap(Map<String, dynamic> map) {
    return PrivacyModel(
      ourPolicy: map[ApiKey.ourPolicy],
      collectionInfo: map[ApiKey.collectionInfo],
      useInfo: map[ApiKey.useInfo],
      sharingInfo: map[ApiKey.sharingInfo],
      dataSecurity: map[ApiKey.dataSecurity],
      userRights: map[ApiKey.userRights],
      childrenPrivacy: map[ApiKey.childrenPrivacy],
      updatesPrivacy: map[ApiKey.updatesPrivacy],
    );
  }
}
