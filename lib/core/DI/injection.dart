import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopescreen/feature/home/data/api/my_repo.dart';
import 'package:shopescreen/feature/home/data/api/web_services.dart';
import 'package:shopescreen/feature/home/presentation/manager/cubit/products_cubit.dart';

final getit = GetIt.instance;

void InitGetIt() {
  getit.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getit()));
  getit.registerLazySingleton<WebServices>(() => WebServices(creatAndSetupDio()));
  getit.registerLazySingleton<MyRepo>(() => MyRepo(getit()));
}

Dio creatAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(milliseconds: 1 * 1000)
..options.receiveTimeout = Duration(milliseconds: 10 * 1000);

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        error:true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        responseBody: true
      )
    );
  
  return dio; // Add this return statement
}