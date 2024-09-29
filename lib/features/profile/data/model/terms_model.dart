import '../../../../core/api/end_ponits.dart';
import '../../domain/entity/terms_entity.dart';

class TermsModel extends TermsEntity {
  TermsModel({
    required super.terms1,
    required super.terms2,
    required super.terms3,
    required super.terms4,
    required super.terms5,
    required super.terms6,
    required super.terms7,
    required super.terms8,
    required super.terms9,
    required super.terms10,
  });

  factory TermsModel.fromMap(Map<String, dynamic> map) {
    return TermsModel(
      terms1: map[ApiKey.terms1] ?? '',
      terms2: map[ApiKey.terms2] ?? '',
      terms3: map[ApiKey.terms3] ?? '',
      terms4: map[ApiKey.terms4] ?? '',
      terms5: map[ApiKey.terms5] ?? '',
      terms6: map[ApiKey.terms6] ?? '',
      terms7: map[ApiKey.terms7] ?? '',
      terms8: map[ApiKey.terms8] ?? '',
      terms9: map[ApiKey.terms9] ?? '',
      terms10: map[ApiKey.terms10] ?? '',
    );
  }
}
