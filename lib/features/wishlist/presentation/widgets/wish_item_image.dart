import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishItemImage extends StatelessWidget {
  const WishItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: true
          ? SizedBox(
              height: 120.h,
              width: 120.w,
            )
          : Image.network(
              'https://kawaiiai.com/wp-content/uploads/2022/09/gangaster-cat-7.jpg',
              width: 120.w,
              height: 120.h,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return SizedBox(
                  width: 120.w,
                  height: 120.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
