import 'package:taswaq/core/api/end_ponits.dart';

import '../../domain/entity/faqs_entity.dart';

class FaqsModel extends FaqsEntity {
  final String id;
  FaqsModel({
    required this.id,
    required super.question,
    required super.answer,
  });

  factory FaqsModel.fromMap(Map<String, dynamic> json) {
    return FaqsModel(
      id: json[ApiKey.id],
      question: json[ApiKey.question],
      answer: json[ApiKey.answer],
    );
  }
}
