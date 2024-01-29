import 'dart:async';
import 'package:consultations_project/presentation/screen/home/__home.dart';
import 'package:consultations_project/presentation/screen/rate/__rate.dart';
import 'package:consultations_project/presentation/screen/view_consult/__view_consult.dart';
import 'package:consultations_project/presentation/screen/view_consult/pdf.dart';
import 'package:consultations_project/routes/routes.dart';
import 'package:consultations_project/utils/__utils.dart';
import 'package:consultations_project/utils/app_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (dynamic error, dynamic stack) {
    if (kDebugMode) {
      print(error);
      print(stack);
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ThemeData.light(),
            initialRoute: AppRoutes.home,
            getPages: [
              //Simple GetPage
              GetPage(
                name: AppRoutes.home,
                page: () => const HomeScreen(),
                binding: HomeBinding(),
              ),
              // GetPage with custom transitions and bindings
              GetPage(
                name: AppRoutes.viewConsult,
                page: () => const ViewConsultScreen(),
                binding: ViewConsultBinding(),
              ),
              // GetPage with default transitions
              GetPage(
                name: AppRoutes.rateSeller,
                page: () => const RateSellerScreen(),
                binding: RateSellerBinding(),
              ),
              GetPage(
                name: AppRoutes.pdf,
                page: () => const PdfPage(),
                binding: ViewConsultBinding(),
              ),
            ],
          );
        },
      ),
    );
  }
}
