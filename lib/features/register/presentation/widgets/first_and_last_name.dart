import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
class FirstAndLastName extends StatelessWidget {
  const FirstAndLastName({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
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
                controller: context.read<RegisterCubit>().firstNameController,
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
                controller: context.read<RegisterCubit>().lastNameController,
                validator: (String? value) {  },
              ),
            ],
          ),
        ),

      ],
    );
  }
}
