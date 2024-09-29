 
import '../../../../core/api/end_ponits.dart';

class TermsEntity {
  final String terms1;
  final String terms2;
  final String terms3;
  final String terms4;
  final String terms5;
  final String terms6;
  final String terms7;
  final String terms8;
  final String terms9;
  final String terms10;

  const TermsEntity({
    required this.terms1,
    required this.terms2,
    required this.terms3,
    required this.terms4,
    required this.terms5,
    required this.terms6,
    required this.terms7,
    required this.terms8,
    required this.terms9,
    required this.terms10,
  });
  Map<String, dynamic> toMap() => {
        ApiKey.terms1: terms1,
        ApiKey.terms2: terms2,
        ApiKey.terms3: terms3,
        ApiKey.terms4: terms4,
        ApiKey.terms5: terms5,
        ApiKey.terms6: terms6,
        ApiKey.terms7: terms7,
        ApiKey.terms8: terms8,
        ApiKey.terms9: terms9,
        ApiKey.terms10: terms10,
      };
}
