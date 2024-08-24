import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_styles.dart';

class DefaultAppButton extends StatelessWidget {
  const DefaultAppButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.icon = const SizedBox(),
    this.padding = 16,
  });
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget icon;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 20)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          alignment: Alignment.center,
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          ///             text,
          ///             style: AppStyles.textStyle14SB.copyWith(
          ///               color: textColor,
          ///             ),
          ///           ),
          ///           icon
          ///         ],
          ///       ),
          ///     ),
          ///   );
          /// }
          children: [
            Text(
              text,
              style: AppStyles.textStyle14SB.copyWith(
                color: textColor,
              ),
            ),
            icon
          ],
        ),
      ),
    );
  }
}
