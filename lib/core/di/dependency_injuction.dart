import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../services/database_service.dart';
import '../services/firebase_auth_service.dart';
import '../services/firestore_database.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/cart/data/source/cart_remote_source.dart';
import '../../features/cart/domain/repo/cart_repo.dart';
import '../../features/login/data/repo/login_repo_impl.dart';
import '../../features/login/data/source/login_remote_source.dart';
import '../../features/login/domain/repo/login_repo.dart';
import '../../features/signup/data/repo/signup_repo_impl.dart';
import '../../features/signup/domain/repo/signup_repo.dart';
import '../../features/product_deatails/data/repo/product_details_repo_impl.dart';
import '../../features/product_deatails/data/source/product_details_remote_source.dart';
import '../../features/product_deatails/domain/repo/product_details_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/data/source/home_remote_source.dart';
import '../../features/home/domain/repo/home_repo.dart';
import '../../features/products/data/source/produt_remote_source.dart';
import '../../features/products/domain/repo/product_repo.dart';
import '../../features/search/data/repo/search_repo_impl.dart';
import '../../features/search/data/source/search_remote_source.dart';
import '../../features/search/domain/repo/search_repo.dart';
import '../../features/products/data/repo/product_repo_impl.dart';
import '../../features/signup/data/source/signup_remote_source.dart';
import '../api/dio_consumer.dart';
import '../cache/cache_helper.dart';

GetIt getIt = GetIt.instance;

setupGetIt() async {
  await CacheHelper().init();
  // general
  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<DatabaseService>(FirestoreDatabase());
  // home
  getIt.registerSingleton<HomeRemoteSource>(HomeRemoteSource(
    api: getIt<DioConsumer>(),
  ));
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(homeRemoteSource: getIt<HomeRemoteSource>()),
  );

  // product
  getIt.registerSingleton<ProductRemoteSource>(
    ProductRemoteSource(
      api: getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      getIt.get<ProductRemoteSource>(),
    ),
  );

  // search
  getIt.registerSingleton<SearchRemoteSource>(
    SearchRemoteSource(
      api: getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(
      getIt.get<SearchRemoteSource>(),
    ),
  );
  // product details
  getIt.registerSingleton<ProductDetailsRemoteSource>(
    ProductDetailsRemoteSource(
      api: getIt<DioConsumer>(),
    ),
  );

  getIt.registerSingleton<ProductDetailsRepo>(
    ProductDetailsRepoImpl(
      productDetailsRemoteSource: getIt.get<ProductDetailsRemoteSource>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  // signup
  getIt.registerSingleton<SignupRemoteSource>(
    SignupRemoteSource(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  getIt.registerSingleton<SignupRepo>(
    SignupRepoImpl(
      signupRemoteSource: getIt.get<SignupRemoteSource>(),
      dataBaseService: getIt<DatabaseService>(),
    ),
  );
  // login
  getIt.registerSingleton<LoginRemoteSource>(
    LoginRemoteSource(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  getIt.registerSingleton<LoginRepo>(
    LoginRepoImpl(
      loginRemoteSource: getIt.get<LoginRemoteSource>(),
      dataBaseService: getIt.get<DatabaseService>(),
    ),
  );
  // carts
  getIt.registerSingleton<CartRemoteSource>(
    CartRemoteSource(
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<CartRepo>(
    CartRepoImpl(
      cartRemoteSource: getIt.get<CartRemoteSource>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
