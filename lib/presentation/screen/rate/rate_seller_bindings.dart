import 'package:consultations_project/presentation/screen/rate/rate_seller_vm.dart';
import 'package:get/get.dart';

class RateSellerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RateSellerViewModel());
  }
}