import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taswaq/features/home/data/repo/home_repo_impl.dart';
import 'package:taswaq/features/home/data/source/home_remote_source.dart';
import 'package:taswaq/features/home/domain/repo/home_repo.dart';
import 'package:taswaq/features/products/data/source/produt_remote_source.dart';
import 'package:taswaq/features/products/domain/repo/product_repo.dart';
import '../../features/products/data/repo/product_repo_impl.dart';
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
}
