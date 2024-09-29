import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.text,
    required this.img,
    this.onTap,
  });
  final String text;
  final String img;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: const Border(
        bottom: BorderSide(color: AppColors.gray50Color),
      ),
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(img),
      title: Text(
        text,
        style: AppStyles.textStyle14M.copyWith(
          color: AppColors.gray150Color,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
