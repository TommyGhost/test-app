import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key, this.height, this.width, this.color = Colors.grey})
      : super(key: key);

  final double? height, width;
  final Color? color;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // *****************************dispose*********************  ***

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 16.0;

    return Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: radiusBoxDecoration(
          colors: [Colors.red, Colors.green, Colors.purple, Colors.white],
          animation: _animation,
        ));
  }
}

class WidgetShimmerCart extends StatefulWidget {
  const WidgetShimmerCart({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetShimmerCart> createState() => _WidgetShimmerCartState();
}

class _WidgetShimmerCartState extends State<WidgetShimmerCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: size.height,
            // width: width(context),
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: 4,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 143.h,
                  width: size.width,
                  child: const Skeleton(),
                );
              },
            ),
          );
        });
  }
}
