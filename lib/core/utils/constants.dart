import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cart/domain/entities/cart_entity.dart';

final double kHorizantalpadding = 16.w;
const String kPaymobApiKey =
    'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1Rjek5EZzVMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkud2JJUVVfalBybWNMQXhCeTF1U3VLVTU0X0R1czk4VHByYlB4ekc2S0lDZWtvbDdWTVRVZ18ycEZTRzVnR1dndFEtcER1azdidndFZWRpQU11a3Rqdmc=';
const int cardPaymentMethodIntegrationId = 4564350;

List<CartEntity> checkoutProducts = [];
double total = 0.0;
