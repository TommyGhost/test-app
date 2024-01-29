import 'package:consultations_project/presentation/screen/view_consult/view_consult_vm.dart';
import 'package:consultations_project/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends GetView<ViewConsultViewModel> {
  const PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    final doc = Get.arguments;

    final name = doc['name'];
    final link = doc['link'];
    return Scaffold(
      appBar: Navbar(
        home: false,
        title: name,
      ),
      body: SfPdfViewer.network(
        link,
        key: controller.pdfViewerKey,
      ),
    );
  }
}
