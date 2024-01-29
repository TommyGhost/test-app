import 'package:consultations_project/presentation/screen/view_consult/view_consult_vm.dart';
import 'package:consultations_project/routes/routes.dart';
import 'package:consultations_project/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:consultations_project/widgets/__widgets.dart';
import 'package:get/get.dart';

class ViewConsultScreen extends GetView<ViewConsultViewModel> {
  const ViewConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final details = Get.arguments;

    final name = details['physician'];
    final gender = details['gender'];
    final job = details['Job'];
    final complaint = details['complaint'];
    final fileName = details['file_name'];
    final fileSize = details['file_size'];
    final docLink = details['link'];

    return Scaffold(
      backgroundColor: Pallet.white,
      appBar: Navbar(
        home: false,
        title: AppStrings.viewConsult,
      ),
      body: Padding(
        padding: padOnly(top: 15, left: 19, right: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(
              name: name,
              job: job,
              gender: gender,
            ),
            30.0.sbH,
            Text(
              AppStrings.complaint,
              style: getSemiBoldStyle(
                fontSize: FontSize.s16,
                height: 18.77.toFigmaHeight(16),
                color: Pallet.primary,
              ),
            ),
            10.0.sbH,
            Expanded(
              child: Text(
                complaint,
                style: getRegularStyle(
                  fontSize: FontSize.s14,
                  height: 21.0.toFigmaHeight(14),
                  color: Pallet.primary,
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.fade,
                softWrap: true,
              ),
            ),
            10.0.sbH,
            Text(
              AppStrings.linkedDocs,
              style: getSemiBoldStyle(
                fontSize: FontSize.s16,
                height: 18.77.toFigmaHeight(16),
                color: Pallet.primary,
              ),
            ),
            10.0.sbH,
            GestureDetector(
              onTap: () {
                Get.toNamed(
                  AppRoutes.pdf,
                  arguments: {
                    'name': fileName,
                    'link': docLink,
                  },
                );
              },
              child: Container(
                height: 53.h,
                width: width(context),
                padding: pad(both: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5.w,
                    color: Pallet.actionsGrey,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.filetype,
                          height: 30.h,
                          width: 30.h,
                          fit: BoxFit.cover,
                        ),
                        8.0.sbW,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fileName,
                              style: getSemiBoldStyle(
                                fontSize: FontSize.s14,
                                height: 16.8.toFigmaHeight(14),
                                color: Pallet.gray1,
                              ),
                            ),
                            Text(
                              fileSize,
                              style: getRegularStyle(
                                fontSize: FontSize.s12,
                                height: 15.6.toFigmaHeight(12),
                                color: Pallet.gray4,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppImages.share,
                          height: 24.h,
                          width: 24.h,
                          fit: BoxFit.cover,
                        ),
                        8.0.sbW,
                        Image.asset(
                          AppImages.download,
                          height: 24.h,
                          width: 24.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            24.0.sbH,
          ],
        ),
      ),
    );
  }
}
