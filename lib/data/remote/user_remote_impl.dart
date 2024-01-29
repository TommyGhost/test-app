import 'package:consultations_project/data/core/network/error_handler.dart';
import 'package:consultations_project/data/core/network/url_path.dart';
import 'package:consultations_project/data/core/network_config.dart';
import 'package:consultations_project/data/remote/user_remote.dart';
import 'package:consultations_project/domain/models/consultation_response.dart';
import 'package:dio/dio.dart';

/// This calls implements the UserRemote logic
class UserRemoteImpl extends UserRemote {
  final Dio dio;

  UserRemoteImpl(
    this.dio,
  );

  @override
  Future<ConsultationResponse?> getConsultation() async {
    try {
      var response = await dio.get(
        "${NetworkConfig.BASE_URL}${UrlPath.getConsultation}",
        options: Options(
          followRedirects: true,
          headers: {"Accept": "application/json"},
        ),
      );
      final responseData = ConsultationResponse.fromJson(response.data);
      return responseData;
    } on DioException catch (err) {
      handleError(err);
      print("Show login remote error:: $err");
      rethrow;
    }
  }
}
