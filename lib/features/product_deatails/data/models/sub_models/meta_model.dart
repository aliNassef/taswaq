import '../../../../../core/api/end_ponits.dart';

class Meta {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json[ApiKey.createdAt] == null
            ? null
            : DateTime.parse(json[ApiKey.createdAt] as String),
        updatedAt: json[ApiKey.updatedAt] == null
            ? null
            : DateTime.parse(json[ApiKey.updatedAt] as String),
        barcode: json[ApiKey.barcode] as String?,
        qrCode: json[ApiKey.qrCode] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.createdAt: createdAt?.toIso8601String(),
        ApiKey.updatedAt: updatedAt?.toIso8601String(),
        ApiKey.barcode: barcode,
        ApiKey.qrCode: qrCode,
      };
}
