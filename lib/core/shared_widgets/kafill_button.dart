import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';

class KafillButton extends StatelessWidget {
  const KafillButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.onTap});
  final double? width;
  final double? height;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith((states) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => AppColors.green)),
        onPressed: onTap,
        child: Text(
          text,
          style: AppTextStyles.font14WhiteBold,
        ),
      ),
    );
  }
}
