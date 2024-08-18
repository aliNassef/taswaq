import 'package:flutter/material.dart';

import '../../features/home/presentation/view/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
