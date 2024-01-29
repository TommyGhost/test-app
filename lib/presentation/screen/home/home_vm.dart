import 'package:consultations_project/data/repository/user_repository.dart';
import 'package:consultations_project/domain/models/consultation_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  UserRepository userRepository = Get.find<UserRepository>();
  final TextEditingController searchBar = TextEditingController();

  Stream<ConsultationResponse?> getConsultation() async* {
    ConsultationResponse? getConsultationResponse =
        await userRepository.getConsultation();
    yield getConsultationResponse;
  }
}
