import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taswaq/features/signup/presentation/views/signup_view.dart';

import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/product_deatails/presentation/views/product_details_view.dart';
import '../../features/products/presentation/views/product_view.dart';
import '../../features/search/presentation/views/search_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
      );
    case ProductView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          final category = settings.arguments as String;
          log("category : $category");
          return ProductView(
            category: category,
          );
        },
      );
    case SearchView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SearchView(),
      );
    case ProductDetailsView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          final productId = settings.arguments as int;
          return ProductDetailsView(
            productId: productId,
          );
        },
      );
    case SignupView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const SignupView();
        },
      );
    case CartView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const CartView();
        },
      );

    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const LoginView();
        },
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
