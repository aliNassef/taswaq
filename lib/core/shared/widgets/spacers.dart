import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizantalSpace extends StatelessWidget {
  const HorizantalSpace(
    this.width, {
    super.key,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.height, {super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}
