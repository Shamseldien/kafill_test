import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_regex.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
class RegisterPassAndConfirmPass extends StatefulWidget {
  const RegisterPassAndConfirmPass({super.key});

  @override
  State<RegisterPassAndConfirmPass> createState() => _RegisterPassAndConfirmPassState();
}

class _RegisterPassAndConfirmPassState extends State<RegisterPassAndConfirmPass> {
 bool isObscure = true;
 bool isObscure2 = true;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password",style: AppTextStyles.font12GreyMedium),
        verticalSpace(8.h),
        KafillTextFormField(
          isObscureText: isObscure ,
          controller: context.read<RegisterCubit>().passwordController,
          suffixIcon:GestureDetector(
            onTap: (){
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: AppColors.gray300,
            ),
          ),
          validator: (String? value) {
            if (value!.isEmpty || !AppRegex.isPasswordValid(value)) {
              return 'Please enter valid Password';
            }
            return null;
          },

        ),
        verticalSpace(16.h),
        Text("Confirm Password",style: AppTextStyles.font12GreyMedium),
        verticalSpace(8.h),
        KafillTextFormField(
          controller: context.read<RegisterCubit>().confirmPasswordController,
          isObscureText: isObscure2 ,
          suffixIcon:GestureDetector(
            onTap: (){
              setState(() {
                isObscure2 = !isObscure2;
              });
            },
            child: Icon(
              isObscure2 ? Icons.visibility_off : Icons.visibility,
              color: AppColors.gray300,

            ),
          ),
          validator: (String? value) {
            if (value!.isEmpty ||context.read<RegisterCubit>().confirmPasswordController.text != context.read<RegisterCubit>().passwordController.text ) {
              return 'Password doesn\'t match';
            }
            return null;
          },

        ),


      ],
    );
  }
}
