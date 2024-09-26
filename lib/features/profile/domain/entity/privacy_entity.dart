import '../../../../core/api/end_ponits.dart';

class PrivacyEntity {
  final String? ourPolicy;
  final String? collectionInfo;
  final String? useInfo;
  final String? sharingInfo;
  final String? dataSecurity;
  final String? userRights;
  final String? childrenPrivacy;
  final String? updatesPrivacy;

  PrivacyEntity({
    this.ourPolicy,
    this.collectionInfo,
    this.useInfo,
    this.sharingInfo,
    this.dataSecurity,
    this.userRights,
    this.childrenPrivacy,
    this.updatesPrivacy,
  });

  Map<String, dynamic> toMap() {
    return {
      ApiKey.ourPolicy: ourPolicy,
      ApiKey.collectionInfo: collectionInfo,
      ApiKey.useInfo: useInfo,
      ApiKey.sharingInfo: sharingInfo,
      ApiKey.dataSecurity: dataSecurity,
      ApiKey.userRights: userRights,
      ApiKey.childrenPrivacy: childrenPrivacy,
      ApiKey.updatesPrivacy: updatesPrivacy,
    };
  }
}
