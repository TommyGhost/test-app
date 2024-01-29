import 'package:consultations_project/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/pallet.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    required this.onTap,
    Key? key,
    this.home = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool home;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: 30.h,
        width: 30.w,
        child: home
            ? Icon(
                Icons.menu,
                size: 24.h,
                color: Pallet.gray1,
              )
            : Icon(
                Icons.arrow_back,
                color: Pallet.black,
                size: 16.w,
              ),
      ),
    );
  }
}
