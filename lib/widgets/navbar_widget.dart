import 'package:consultations_project/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'back_arrow_widget.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final void Function()? onTap;
  final Function()? onTapLeftAction;
  final Function()? onTapRightAction;
  final double height;
  final bool home;
  final Color? color;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  const Navbar({
    Key? key,
    this.title,
    this.home = true,
    this.color,
    this.elevation,
    this.onTap,
    this.height = kToolbarHeight,
    this.onTapLeftAction,
    this.onTapRightAction,
    this.padding,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: home == false
          ? BackArrowButton(
              onTap: onTap ??
                  () {
                    Get.back();
                  })
          : BackArrowButton(
              onTap: onTap ?? () {},
              home: true,
            ),
      title: Text(
        title ?? "",
        style: getMediumStyle(
          fontSize: FontSize.s24,
          height: 28.15.toFigmaHeight(24),
          color: color ?? Pallet.primary,
        ),
      ),
      // centerTitle: true,
      elevation: elevation ?? 0,
      surfaceTintColor: Pallet.white,
      backgroundColor: Colors.white,
      bottomOpacity: 0,
      toolbarHeight: height,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Pallet.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      actions: home
          ? [
              GestureDetector(
                onTap: onTapLeftAction,
                child: Badge(
                  smallSize: 6.r,
                  backgroundColor: Pallet.redBadge,
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 0.5.w, color: Pallet.actionsGrey),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 16.w,
                        color: Pallet.primary,
                      ),
                    ),
                  ),
                ),
              ),
              10.0.sbW,
              GestureDetector(
                onTap: onTapRightAction,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5.w, color: Pallet.actionsGrey),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 16.w,
                      color: Pallet.primary,
                    ),
                  ),
                ),
              ),
              19.0.sbW,
            ]
          : null,
    );
  }
}
