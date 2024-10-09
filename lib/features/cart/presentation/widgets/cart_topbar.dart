import 'package:flutter/material.dart';
 import '../../../../core/shared/widgets/custom_app_bar.dart';
 
 
class CartTopBar extends StatelessWidget implements PreferredSizeWidget {
  const CartTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 10),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 30,
        ),
        child: buildCustomAppBar(title: 'My Cart', showBackButton: false),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
