import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/core/helpers/app_navigation_extintion.dart';
import 'package:kafill/core/routing/routers.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';


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
              recognizer: TapGestureRecognizer()..onTap = (){
                  context.pushNamed(Routes.registerScreen);
                },


            ),
          ],
        ),
      ),
    );
  }
}
