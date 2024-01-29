// ignore_for_file: unused_catch_stack

import 'package:consultations_project/data/core/network/app_logger.dart';
import 'package:consultations_project/data/core/network/laravel_error.dart';
import 'package:dio/dio.dart';
import 'api_error_model.dart';

/// Helper class for converting [DioException] into readable formats
class ApiError {
  int? errorType = 0;

  final logger = getLogger('ApiError');

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioException) {
      DioException dioError = error; // as DioException;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout, please try again later";
          break;
        case DioExceptionType.unknown:
          errorDescription = "Connection failed due to internet connection";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;

        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        case DioExceptionType.badResponse:
          errorType = dioError.response?.statusCode;
          errorDescription = _handleErrorFromStatusCode(dioError.response);
          break;
        case DioExceptionType.badCertificate:
          errorDescription = 'Bad Certificate';
          break;
        default:
          errorDescription =
              "Connection failed, Please check internet connection";
      }
    } else {
      errorDescription = "Oops! an error occurred, we are fixing it";
    }
  }

  @override
  String toString() => '$errorDescription';

  String? _handleErrorFromStatusCode(Response? response) {
    String? message;
    switch (response?.statusCode) {
      case 400:
      case 403:
      case 404:
      case 409:
        message = ApiErrorModel.fromJson(response?.data).message;
        break;
      case 422:
        message = _handleResponseFromLaravel(response);
        break;
      case 500:
        message = 'Something went wrong while processing your request';
        break;
      default:
    }
    return message;
  }

  String _handleResponseFromLaravel(Response<dynamic>? data) {
    final response = LaravelError.fromJson(data?.data);
    if (response.errors!.email!.isNotEmpty) {
      return response.errors!.email!.first;
    }
    if (response.errors!.username!.isNotEmpty) {
      return response.errors!.username!.first;
    }
    if (response.errors!.picture!.isNotEmpty) {
      return response.errors!.picture!.first;
    }
    if (response.errors!.receiverPhoneNo!.isNotEmpty) {
      return response.errors!.receiverPhoneNo!.first;
    }
    if (response.errors!.token!.isNotEmpty) {
      return response.errors!.token!.first;
    }
    if (response.errors!.country!.isNotEmpty) {
      return response.errors!.country!.first;
    }
    if (response.errors!.deviceName!.isNotEmpty) {
      return response.errors!.deviceName!.first;
    }
    if (response.errors!.password!.isNotEmpty) {
      return response.errors!.password!.first;
    }
    if (response.errors!.secret!.isNotEmpty) {
      return response.errors!.secret!.first;
    }
    return '';
  }
}
