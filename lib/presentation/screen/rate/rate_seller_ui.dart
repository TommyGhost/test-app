import 'package:consultations_project/presentation/screen/rate/rate_seller_vm.dart';
import 'package:consultations_project/utils/__utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:consultations_project/widgets/__widgets.dart';
import 'package:get/get.dart';

class RateSellerScreen extends GetView<RateSellerViewModel> {
  const RateSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final details = Get.arguments;

    final name = details['name'];
    final job = details['Job'];

    return Scaffold(
      backgroundColor: Pallet.white,
      appBar: Navbar(
        home: false,
        title: AppStrings.rateSeller,
      ),
      body: SingleChildScrollView(
        padding: padOnly(top: 25, left: 19, right: 19),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 165.h,
                      height: 165.h,
                      decoration: const BoxDecoration(
                        color: Pallet.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    25.0.sbH,
                    Text(
                      name,
                      style: getMediumStyle(
                        fontSize: FontSize.s20,
                        height: 23.46.toFigmaHeight(20),
                        color: Pallet.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    7.0.sbH,
                    Text(
                      job,
                      style: getRegularStyle(
                        fontSize: FontSize.s16,
                        height: 18.77.toFigmaHeight(16),
                        color: Pallet.suffixButton,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    25.0.sbH,
                    SizedBox(
                      width: 160.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          5,
                          (index) => Icon(
                            CupertinoIcons.star_fill,
                            size: 24.w,
                            color: Pallet.gray5,
                          ),
                        ),
                      ),
                    ),
                    35.0.sbH,
                  ],
                ),
              ),
              Text(
                AppStrings.leaveComment,
                style: getMediumStyle(
                  fontSize: FontSize.s16,
                  height: 21.0.toFigmaHeight(16),
                  color: Pallet.primary,
                ),
              ),
              15.0.sbH,
              InputField(
                hintText: AppStrings.enterText,
                fontHeight: 19.6.toFigmaHeight(14),
                maxLines: 7,
                onChanged: (val) {
                  controller.updateComment(val);
                  controller.formKey.currentState?.validate();
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please fill this field';
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.sentences,
                autovalidateMode: controller.autovalidateMode,
                maxLength: int.parse(AppStrings.charLimit),
              ),
              4.0.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => Text(
                      '${controller.comment.value.length}/${AppStrings.charLimit}',
                      style: getMediumStyle(
                        fontSize: FontSize.s12,
                        height: 19.2.toFigmaHeight(12),
                        color: Pallet.actionsGrey,
                      ).copyWith(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              147.0.sbH,
              Obx(
                () => Button(
                  loading: controller.loading.value,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (controller.formKey.currentState!.validate()) {
                      controller.testLoading();
                    } else {
                      controller
                          .setValidateMode(AutovalidateMode.onUserInteraction);
                    }
                  },
                  title: AppStrings.submit,
                  buttonTextColor: Pallet.white,
                ),
              ),
              20.0.sbH,
              Button(
                onPressed: () => Get.back(),
                title: AppStrings.cancel,
                buttonType: ButtonType.outline,
              ),
              20.0.sbH,
            ],
          ),
        ),
      ),
    );
  }
}
