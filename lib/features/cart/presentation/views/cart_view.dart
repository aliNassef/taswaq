import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'CartView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CartViewBody(),
      ),
    );
  }
}

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
