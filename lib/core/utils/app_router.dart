import 'package:flutter/material.dart';

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
        builder: (_) => const ProductView(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
