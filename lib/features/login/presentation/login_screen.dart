import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_navigation_extintion.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/routing/app_router.dart';
import 'package:kafill/core/routing/routers.dart';
import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/login/presentation/widgets/email_and_pass.dart';

import 'widgets/dont_have_account_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Login",style: AppTextStyles.font18DarkBold.copyWith(
         fontFamily:  "Montserrat"
        ),),
      ),
      body:   SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/login_image.png",width: 255.w,)),
              const  EmailAndPass(),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                           fillColor: MaterialStateColor.resolveWith((states) => AppColors.green),
                          value: true, onChanged: (value){}),
                      Text("Remember me",style: AppTextStyles.font12BlackMedium,)

                    ],
                  ),

                  Text("Forgot Password?",style: AppTextStyles.font12BlackMedium,)

                ],
              ),
              verticalSpace(34),
              KafillButton(
                onTap:  () {
                context.pushNamed(Routes.registerScreen);
              },
                text: 'Login',
              ),

              verticalSpace(24),


             const DontHaveAccountText()
            ],
          ),
        ),
      ),

    );
  }
}
