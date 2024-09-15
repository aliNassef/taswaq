import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:taswaq/features/wishlist/domain/repo/wishlist_repo.dart';
import 'package:taswaq/features/wishlist/presentation/cubit/wish_list_cubit.dart';

import '../../../../core/di/dependency_injuction.dart';
import '../widgets/wishlist_view_body.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: BlocProvider(
          create: (context) =>
              WishListCubit(getIt<WishlistRepo>())..getWishListData(),
          child: const WishlistViewBody(),
        ),
      ),
    );
  }
}
