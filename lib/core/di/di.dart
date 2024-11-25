import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/ecommerce/home/data/data_source/ds_home_remote.dart';
import '../../features/ecommerce/home/data/repo_impl/home_repo_impl.dart';
import '../../features/ecommerce/home/domain/repo_base/home_repo_base.dart';
import '../../features/ecommerce/home/domain/usecases/home_usecase.dart';
import '../../features/ecommerce/home/presentation/manager/home_bloc.dart';
import '../../features/ecommerce/product_details/data/data_source/ds_product_details_remote.dart';
import '../../features/ecommerce/product_details/data/repo_impl/pdetails_repo_impl.dart';
import '../../features/ecommerce/product_details/domain/repo_base/pdetails_repo_base.dart';
import '../services/network/api_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Dio
  sl.registerLazySingleton(() => Dio());

  // Register ApiService
  sl.registerLazySingleton(() => ApiService());

  // Home
  sl.registerLazySingleton<DSHomeRemote>(() => DSHomeRemoteImpl());
  sl.registerLazySingleton<HomeRepoBase>(
          () => HomeRepoImpl(dsHomeRemote: sl<DSHomeRemote>()));
  sl.registerLazySingleton<HomeUseCase>(
          () => HomeUseCase(homeRepoBase: sl<HomeRepoBase>()));
  sl.registerFactory(() => HomeBloc(sl<HomeUseCase>()));

  //product details
  sl.registerLazySingleton<PDetailsRepoBase>(
      () => PDetailsRepoImpl(dsProductDetailsRemote: sl()));
  sl.registerLazySingleton<DSProductDetailsRemote>(
      () => DSProductDetailsRemoteImpl());
  sl.registerLazySingleton(() =>
      PDetailsRepoImpl(dsProductDetailsRemote: sl<DSProductDetailsRemote>()));
}
