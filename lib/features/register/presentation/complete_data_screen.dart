import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_assets.dart';
 import 'package:kafill/core/helpers/app_regex.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
import 'package:kafill/features/register/presentation/widgets/favourit_social_media.dart';
import 'package:kafill/features/register/presentation/widgets/select_gender.dart';
import 'package:kafill/features/register/presentation/widgets/skills.dart';
import 'package:kafill/features/splash/cubit/splash_cubit.dart';

class CompleteDateScreen extends StatelessWidget {
  const CompleteDateScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {

      },
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) => GestureDetector(
                onTap: () {
                  context.read<RegisterCubit>().pickProfilePic();
                },
                child: Align(
                    alignment: Alignment.center,
                    child: context.read<RegisterCubit>().profilePic == null
                        ? Image.asset(
                            AppAssets.chooseImage,
                            width: 83.w,
                            height: 83.h,
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(File(context
                                .read<RegisterCubit>()
                                .profilePic!
                                .path)),
                            radius: 45.5,
                          )),
              ),
            ),
            verticalSpace(16.h),
            Text(
              "About",
              style: AppTextStyles.font12GreyMedium,
            ),
            verticalSpace(8.h),
            Form(
              key: context.read<RegisterCubit>().completeRegisterValidationKey,
              child: KafillTextFormField(
                maxLines: 5,
                validator: (String? value) {
                  if (value!.isEmpty || !AppRegex.hasMinAboutLength(value)) {
                    return 'The minimum length is 10 characters';
                  }
                  return null;
                },
                controller: context.read<RegisterCubit>().aboutController,
              ),
            ),
            verticalSpace(16.h),
            Text(
              "Salary",
              style: AppTextStyles.font12GreyMedium,
            ),
            Container(
              height: 56.h,
              decoration: BoxDecoration(
                  color: AppColors.gray50,
                  borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.symmetric(horizontal: 41.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () {
                              context.read<RegisterCubit>().decrement();
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: AppColors.green,
                              size: 15,
                            ))),
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                    "SAR  ${context.read<RegisterCubit>().salary}",
                    style: AppTextStyles.font16Grey800Medium,
                  ))),
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () {
                              context.read<RegisterCubit>().increment();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: AppColors.green,
                              size: 15,
                            ))),
                  ),
                ],
              ),
            ),
            verticalSpace(8.h),
            verticalSpace(16),
            Text(
              "Birth Date",
              style: AppTextStyles.font12GreyMedium,
            ),
            verticalSpace(8),
            Container(
              height: 56.h,
              decoration: BoxDecoration(
                  color: AppColors.gray50,
                  borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                      child: Text(context.read<RegisterCubit>().selectedDate)),
                  IconButton(
                      onPressed: () {
                        context.read<RegisterCubit>().selectDate(context);
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: AppColors.grey400,
                      ))
                ],
              ),
            ),
            verticalSpace(16),
            const GenderSelectionScreen(),
            verticalSpace(16),
            const Skills(),
            verticalSpace(16),
            FavoriteSocialMediaScreen(
                socialMedia: context
                    .read<SplashCubit>()
                    .dependenciesData!
                    .data
                    .socialMedia),
            verticalSpace(25),
            KafillButton(
                text: 'submit',
                onTap: () {

                  if (!context.read<RegisterCubit>().checkFieldsStatus()) {
                    if (context.read<RegisterCubit>().completeRegisterValidationKey.currentState!.validate()) {
                      context.read<RegisterCubit>().registerUser();
                    }
                  }
                }),
            verticalSpace(25),
          ],
        ),
      ),
    );
  }
}
