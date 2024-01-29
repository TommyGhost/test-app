import 'package:consultations_project/presentation/screen/view_consult/view_consult_vm.dart';
import 'package:get/get.dart';

class ViewConsultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewConsultViewModel());
  }
}
