import 'dart:developer';

import 'package:flutter/material.dart';
import '../../features/search/presentation/views/search_view.dart';

import '../../features/home/presentation/view/home_view.dart';
import '../../features/products/presentation/views/product_view.dart';

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
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
