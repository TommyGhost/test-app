import 'package:consultations_project/routes/routes.dart';
import 'package:consultations_project/utils/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateSellerViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();
  final RxString comment = ''.obs;
  final Rx<AutovalidateMode> _autovalidateMode = AutovalidateMode.disabled.obs;
  final Rx<bool> loading = false.obs;

  AutovalidateMode get autovalidateMode => _autovalidateMode.value;

  setValidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode.value = autovalidateMode;
  }

  void updateComment(String newComment) {
    comment.value = newComment;
  }

  void startLoader() {
    loading.value = true;
  }

  void stopLoader() {
    loading.value = false;
  }

  Future<void> testLoading() async {
    startLoader();
    await Future.delayed(const Duration(seconds: 2));
    stopLoader();
    showCustomToast('Seller rated successfully', success: true);
    Get.offAllNamed(AppRoutes.home);
  }
}
