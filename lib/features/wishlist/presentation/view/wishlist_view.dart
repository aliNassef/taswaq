import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/wishlist_topbar.dart';
import '../../domain/repo/wishlist_repo.dart';
import '../cubit/wish_list_cubit.dart';

import '../../../../core/di/dependency_injuction.dart';
import '../widgets/wishlist_view_body.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WishListTopBar(),
      body: BlocProvider(
        create: (context) =>
            WishListCubit(getIt<WishlistRepo>())..getWishListData(),
        child: const WishlistViewBody(),
      ),
    );
  }
}
