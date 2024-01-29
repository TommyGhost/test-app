import 'package:consultations_project/data/remote/user_remote.dart';
import 'package:consultations_project/data/remote/user_remote_impl.dart';
import 'package:consultations_project/data/repository/user_repository.dart';
import 'package:consultations_project/data/repository/user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get/get.dart';

import 'home_vm.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() {
      Dio dio = Dio();
      dio.interceptors.add(PrettyDioLogger());
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
      return dio;
    });
    Get.lazyPut<UserRemote>(() => UserRemoteImpl(Get.find<Dio>()));
    Get.lazyPut<UserRepository>(
        () => UserRepositoryImpl(Get.find<UserRemote>()));
    Get.lazyPut(() => HomeViewModel());
  }

}
