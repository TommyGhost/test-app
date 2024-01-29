// ignore_for_file: prefer_is_empty

import 'package:consultations_project/domain/models/consultation_response.dart';
import 'package:consultations_project/routes/routes.dart';
import 'package:consultations_project/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:consultations_project/presentation/screen/home/home_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:consultations_project/widgets/__widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.white,
      floatingActionButton: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Pallet.white,
          boxShadow: [
            BoxShadow(
              color: Pallet.shadow.withOpacity(0.08),
              spreadRadius: 6.r,
              blurRadius: 12.r,
              offset: Offset(0, 6.h),
            ),
          ],
          border: Border.all(color: Pallet.grayBorder),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.add,
          size: 30.w,
          color: Pallet.gray1,
        ),
      ),
      appBar: Navbar(
        title: AppStrings.appName,
        onTap: () {
          showCustomToast('Menu button pressed', success: true);
        },
        onTapLeftAction: () {
          showCustomToast('Notifications button pressed', success: true);
        },
        onTapRightAction: () {
          showCustomToast('Cart button pressed', success: true);
        },
      ),
      body: StreamBuilder<ConsultationResponse?>(
        stream: controller.getConsultation(),
        builder: (context, snapshot) {
          ConsultationResponse? request = snapshot.data;
          var consultations = request?.data;
          if (snapshot.data != null) {
            return Container(
                child: consultations?.length == 0
                    ? Padding(
                        padding: pad(horiz: 72.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: pad(horiz: 5),
                              width: 273.w,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      AppStrings.noConsultHistory,
                                      style: getSemiBoldStyle(
                                        fontSize: FontSize.s20,
                                        height: 23.46.toFigmaHeight(20),
                                        color: Pallet.primary,
                                      ),
                                    ),
                                  ),
                                  15.0.sbH,
                                  Text(
                                    AppStrings.uHaveNo,
                                    style: getRegularStyle(
                                      fontSize: FontSize.s14,
                                      height: 16.42.toFigmaHeight(14),
                                      color: Pallet.gray3,
                                    ),
                                  ),
                                  25.0.sbH,
                                  Button(
                                    onPressed: () {},
                                    title: AppStrings.bookAppoint,
                                    height: 50.h,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: padOnly(top: 30, left: 19, right: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputField(
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: Pallet.actionsGrey,
                                size: 16.w,
                              ),
                              hintText: AppStrings.search,
                              controller: controller.searchBar,
                              suffixIcon: Padding(
                                padding: padOnly(left: 10, right: 20),
                                child: SizedBox(
                                  width: 50.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width:
                                            0.5, // Width of the vertical divider
                                        color: Pallet
                                            .actionsGrey, // Color of the vertical divider
                                      ),
                                      13.5.sbW,
                                      GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.tune,
                                          size: 32.w,
                                          color: Pallet.suffixButton,
                                          weight: 1.5,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            30.0.sbH,
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 24.h),
                                itemCount: consultations?.length ?? 0,
                                itemBuilder: (_, index) {
                                  Data? newConsultation = consultations?[index];
                                  return InfoCard(
                                    consult: true,
                                    name: '${newConsultation?.name}',
                                    job: '${newConsultation?.job}',
                                    date: "${newConsultation?.appointmentDate}",
                                    duration: '${newConsultation?.duration}',
                                    onSelected: (value) {
                                      if (value == AppStrings.view) {
                                        Get.toNamed(
                                          AppRoutes.viewConsult,
                                          arguments: {
                                            "physician": newConsultation
                                                ?.details?.physician,
                                            "gender": newConsultation
                                                ?.details?.gender,
                                            "Job":
                                                newConsultation?.details?.job,
                                            "complaint": newConsultation
                                                ?.details?.complaint,
                                            "file_name": newConsultation
                                                ?.details?.linkedDocs?.fileName,
                                            "file_size": newConsultation
                                                ?.details?.linkedDocs?.fileSize,
                                            "link": newConsultation
                                                ?.details?.linkedDocs?.link,
                                          },
                                        );
                                      } else if (value == AppStrings.shop) {
                                        // Get.toNamed(AppRoutes.viewConsult);
                                      } else if (value ==
                                          AppStrings.rateSeller) {
                                        Get.toNamed(
                                          AppRoutes.rateSeller,
                                          arguments: {
                                            'name': newConsultation?.name,
                                            'Job': newConsultation?.job,
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ));
          } else {
            return const WidgetShimmerCart();
          }
        },
      ),
    );
  }
}
