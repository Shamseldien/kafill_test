import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_assets.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
 import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
 import 'package:kafill/features/register/presentation/widgets/password_and_confirm_password.dart';
import 'package:kafill/features/register/presentation/widgets/register_type.dart';
import 'package:kafill/features/whoAmI/cubit/who_am_i_cubit.dart';
import 'package:kafill/features/whoAmI/cubit/who_am_i_state.dart';
 class WhoAmI extends StatelessWidget {
  const WhoAmI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WhoAmICubit,WhoAmIState>(
      listener: (context,state){

        },
      builder:(context,state)=> SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Who Am I",style: AppTextStyles.font18DarkBold,),
            verticalSpace(30.h),
            Align(
                alignment: Alignment.center,
                child: Image.asset(AppAssets.chooseImage,width: 83.w,)),
            verticalSpace(30.h),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 163.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("First Name",style: AppTextStyles.font12GreyMedium),
                      verticalSpace(8.h),
                      KafillTextFormField(
                        isEnabled: false,
                         validator: (String? value) {

                        },
                      ),
                    ],
                  ),
                ),
                horizontalSpace(8.w),
                SizedBox(
                  width: 163.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Last Name",style: AppTextStyles.font12GreyMedium),
                      verticalSpace(8.h),
                      KafillTextFormField(
                        isEnabled: false,
                        initialValue: "Kafill",
                        validator: (String? value) {

                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),

             verticalSpace(16.h),
            Text(
              "Email Address",
              style: AppTextStyles.font12GreyMedium,
            ),
            verticalSpace(8.h),
            KafillTextFormField(
              // controller: context.read<RegisterCubit>().emailController,
              isEnabled: false,
              validator: (String? value) {

              },),
            verticalSpace(16.h),
            const RegisterPassAndConfirmPass(),
            verticalSpace(16.h),
            Text("User Type", style: AppTextStyles.font12GreyMedium),
            verticalSpace(8.h),
            const RegisterType(),
            verticalSpace(56.h),
          ],
        ),
      ),
    );
  }
}
