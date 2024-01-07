import 'package:flutter/material.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';


class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have account ?',
              style: AppTextStyles.font14GrayMedium,
            ),
            TextSpan(
              text: ' Register',
              style:  AppTextStyles.font14GrayMedium.copyWith(
                color: AppColors.green
              ),
            ),
          ],
        ),
      ),
    );
  }
}
