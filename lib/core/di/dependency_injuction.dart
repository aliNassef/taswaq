import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taswaq/features/login/data/repo/login_repo_impl.dart';
import 'package:taswaq/features/login/data/source/login_remote_source.dart';
import 'package:taswaq/features/login/domain/repo/login_repo.dart';
import 'package:taswaq/features/signup/data/repo/signup_repo_impl.dart';
import 'package:taswaq/features/signup/domain/repo/signup_repo.dart';
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
  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton(CacheHelper());
  getIt.registerSingleton<HomeRemoteSource>(HomeRemoteSource(
    api: getIt<DioConsumer>(),
  ));
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(homeRemoteSource: getIt<HomeRemoteSource>()),
  );

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
  getIt.registerSingleton<ProductDetailsRemoteSource>(
    ProductDetailsRemoteSource(
      api: getIt<DioConsumer>(),
    ),
  );

  getIt.registerSingleton<ProductDetailsRepo>(
    ProductDetailsRepoImpl(
      getIt.get<ProductDetailsRemoteSource>(),
    ),
  );
  getIt.registerSingleton<SignupRemoteSource>(
    SignupRemoteSource(
      api: getIt<DioConsumer>(),
    ),
  );

  getIt.registerSingleton<SignupRepo>(
    SignupRepoImpl(
      getIt.get<SignupRemoteSource>(),
    ),
  );

  getIt.registerSingleton<LoginRemoteSource>(
    LoginRemoteSource(
      api: getIt<DioConsumer>(),
    ),
  );

  getIt.registerSingleton<LoginRepo>(
    LoginRepoImpl(
      getIt.get<LoginRemoteSource>(),
    ),
  );
}
