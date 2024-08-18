import 'package:taswaq/core/api/end_ponits.dart';

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: (json[ApiKey.width] as num?)?.toDouble(),
        height: (json[ApiKey.height] as num?)?.toDouble(),
        depth: (json[ApiKey.depth] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        ApiKey.width: width,
        ApiKey.height: height,
        ApiKey.depth: depth,
      };
}
