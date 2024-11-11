import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> buildLoadingBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          width: 80.w,
          height: 80.h, 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Lottie.asset(
            'assets/animation/loading.json',
            height: 70.h,
            width: 70.w,
          ),
        ),
      );
    },
  );
}
