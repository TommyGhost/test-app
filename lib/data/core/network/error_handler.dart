import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../utils/snack_message.dart';


void handleError(dynamic error) {
  var errorString = error.response.toString();
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.cancel:
        showCustomToast("Request to API server was cancelled");
        break;
      case DioExceptionType.connectionTimeout:
        showCustomToast("Connection timeout with API server, Please check internet connection");
        break;
      case DioExceptionType.unknown:
        showCustomToast("Connection to API server failed due to internet connection");
        break;
      case DioExceptionType.receiveTimeout:
        showCustomToast("Receive timeout in connection with API server");
        break;
      case DioExceptionType.badResponse:
        final errorMessage =  error.response?.data["message"];
        print("RESPONSE ERROR:::::::::::::::$errorMessage");
        if(errorMessage!=null) {
          showCustomToast(errorMessage);
        }else{
          showCustomToast(error.response?.data)["errors"];
        }
        break;
      case DioExceptionType.sendTimeout:
        showCustomToast("Send timeout in connection with API server");
        break;
      default:
        showCustomToast("Something went wrong");
        break;
    }
  } else {
    var json = jsonDecode(errorString);
    var nameJson = json['message'];
    showCustomToast(nameJson);
    throw nameJson;
  }
}