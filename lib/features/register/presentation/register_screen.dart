import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/features/register/presentation/widgets/register_steper.dart';
 class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",style: AppTextStyles.font18DarkBold.copyWith(
            fontFamily:  "Montserrat"
        ),),
      ),
      body:   SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              RegisterSteper(activeStep: 0),
               Align(
                alignment: AlignmentDirectional.bottomEnd,
                 child: KafillButton(
                   width: 160.w,
                  onTap:  () {

                   },
                  text: 'Next',
              ),
               ),



             ],
          ),
        ),
      ),

    );
  }
}
