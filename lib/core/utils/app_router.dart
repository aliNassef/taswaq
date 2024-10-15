import 'dart:developer';
import 'package:flutter/material.dart';
import '../../features/checkout/presentation/view/checkout_review.dart';
import '../../features/checkout/presentation/view/checkout_view.dart';
import '../../features/checkout/presentation/view/order_placced_successfuly_view.dart';
import '../../features/checkout/presentation/view/preview_item_view.dart';
import '../../features/profile/presentation/views/order_history_view.dart';
import '../../features/profile/presentation/views/privacy_policy_view.dart';
import '../../features/profile/presentation/views/change_pass_view.dart';
import '../../features/profile/presentation/views/faqs_view.dart';
import '../../features/profile/presentation/views/new_pass_view.dart';
import '../../features/profile/presentation/views/shipping_address_view.dart';
import '../../features/profile/presentation/views/terms_condations_view.dart';
import '../../features/signup/presentation/views/signup_view.dart';
import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/product_deatails/presentation/views/product_details_view.dart';
import '../../features/products/presentation/views/product_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../shared/widgets/custom_no_internet_widget.dart';

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
    case LayoutView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const LayoutView();
        },
      );

    case ChangePassView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const ChangePassView();
        },
      );
    case NewPassView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const NewPassView();
        },
      );

    case PrivacyPolicyView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const PrivacyPolicyView();
        },
      );
    case TermsCondationsView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const TermsCondationsView();
        },
      );
    case FaqsView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const FaqsView();
        },
      );
    case ShippingAddressView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const ShippingAddressView();
        },
      );
    case OrderHistoryView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const OrderHistoryView();
        },
      );
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const CheckoutView();
        },
      );
    case CheckoutReviewView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const CheckoutReviewView();
        },
      );
    case PreviewItemView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const PreviewItemView();
        },
      );
    case OrderPlacedSuccessfuly.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const OrderPlacedSuccessfuly();
        },
      );
    case CustomNoInternetWidget.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const CustomNoInternetWidget();
        },
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
