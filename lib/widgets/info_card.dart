import 'package:consultations_project/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:date_time_format/date_time_format.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.job,
    this.date,
    this.duration,
    this.gender,
    this.consult = false,
    this.onSelected,
  });

  final String name;
  final String job;
  final String? date;
  final String? duration;
  final String? gender;
  final bool consult;
  final void Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      height: consult ? 143.h : 96.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Pallet.white,
        boxShadow: [
          BoxShadow(
            color: Pallet.shadow.withOpacity(0.08),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
        border: Border.all(color: Pallet.grayBorder),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: consult ? 20.h : 18.h,
            left: 15.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.h,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Pallet.black,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    21.0.sbW,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          consult ? name : '$name ($gender)',
                          style: getSemiBoldStyle(
                            fontSize: FontSize.s16,
                            height: 18.77.toFigmaHeight(16),
                            color: Pallet.primary,
                          ),
                        ),
                        5.0.sbH,
                        Text(
                          job,
                          style: getRegularStyle(
                            fontSize: FontSize.s14,
                            height: 16.42.toFigmaHeight(14),
                            color: Pallet.gray3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          consult
              ? Positioned(
                  bottom: 14.h,
                  left: 15.w,
                  child: SizedBox(
                    width: 357.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 93.h,
                              height: 34.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Pallet.actionsGrey,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: Text(
                                  DateTimeFormat.format(DateTime.parse(date!),
                                      format: 'd/m/Y'),
                                  style: getRegularStyle(
                                    fontSize: FontSize.s14,
                                    height: 16.42.toFigmaHeight(14),
                                    color: Pallet.primary,
                                  ),
                                ),
                              ),
                            ),
                            10.0.sbW,
                            Container(
                              width: 84.h,
                              height: 34.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Pallet.actionsGrey,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: Text(
                                  DateTimeFormat.format(DateTime.parse('$date'),
                                      format: 'H:i A'),
                                  style: getRegularStyle(
                                    fontSize: FontSize.s14,
                                    height: 16.42.toFigmaHeight(14),
                                    color: Pallet.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 72.h,
                          height: 34.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Pallet.actionsGrey,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              '$duration ${AppStrings.mins}',
                              style: getRegularStyle(
                                fontSize: FontSize.s14,
                                height: 16.42.toFigmaHeight(14),
                                color: Pallet.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : 0.0.sbH,
          consult
              ? Positioned(
                  top: 20.h,
                  right: 19.w,
                  child: PopupMenuButton<String>(
                    color: Pallet.white,
                    surfaceTintColor: Pallet.white,
                    onSelected: onSelected,
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: AppStrings.view,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 142.w,
                            height: 44.h,
                            child: Text(
                              AppStrings.view,
                              style: getRegularStyle(
                                fontSize: FontSize.s14,
                                height: 24.0.toFigmaHeight(14),
                                color: Pallet.primary,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: AppStrings.shop,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 142.w,
                            height: 44.h,
                            child: Text(
                              AppStrings.shop,
                              style: getRegularStyle(
                                fontSize: FontSize.s14,
                                height: 24.0.toFigmaHeight(14),
                                color: Pallet.primary,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: AppStrings.rateSeller,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 142.w,
                            height: 44.h,
                            child: Text(
                              AppStrings.rateSeller,
                              style: getRegularStyle(
                                fontSize: FontSize.s14,
                                height: 24.0.toFigmaHeight(14),
                                color: Pallet.primary,
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    child: Icon(
                      Icons.more_horiz_outlined,
                      color: Pallet.black,
                      weight: 4.w,
                    ),
                  ),
                )
              : 0.0.sbH,
        ],
      ),
    );
  }
}
