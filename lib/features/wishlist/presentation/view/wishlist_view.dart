import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/services/firestore_database.dart';
import 'package:taswaq/features/wishlist/data/repo/wishlist_repo_impl.dart';
import 'package:taswaq/features/wishlist/data/source/wishlist_remote_source.dart';
import 'package:taswaq/features/wishlist/presentation/wishlist_cubit/wish_list_cubit.dart';

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
          create: (context) => WishListCubit(
            WishlistRepoImpl(
              wishlistRemoteSource: WishlistRemoteSource(
                databaseService: FirestoreDatabase(),
              ),
            ),
          )..getWishListData(),
          child: const WishlistViewBody(),
        ),
      ),
    );
  }
}
