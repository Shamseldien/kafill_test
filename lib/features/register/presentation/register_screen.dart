import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/presentation/widgets/register_steper.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        context.read<RegisterCubit>().changeActiveStep(0);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register",style: AppTextStyles.font18DarkBold.copyWith(
              fontFamily:  "Montserrat"
          ),),
        ),
        body:   SingleChildScrollView(
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: 0.w,vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterStepper(),
                 Align(
                  alignment: AlignmentDirectional.bottomEnd,
                   child: KafillButton(
                     width: 160.w,
                     onTap:  () {
                       if(context.read<RegisterCubit>().activeStep == 0) {
                         context.read<RegisterCubit>().changeActiveStep(1);
                       } else if(context.read<RegisterCubit>().activeStep == 1) {
                         context.read<RegisterCubit>().changeActiveStep(2);
                       } else if(context.read<RegisterCubit>().activeStep == 2) {
                         context.read<RegisterCubit>().changeActiveStep(3);
                       }
                     },
                     text: 'Next',
                   ),

                 ),



               ],
            ),
          ),
        ),

      ),
    );
  }
}
