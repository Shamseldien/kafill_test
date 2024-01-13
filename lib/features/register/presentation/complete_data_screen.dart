import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/dependency_injecion/di.dart';
import 'package:kafill/core/helpers/app_assets.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:kafill/features/register/presentation/widgets/favourit_social_media.dart';
import 'package:kafill/features/register/presentation/widgets/select_birth_date.dart';
import 'package:kafill/features/register/presentation/widgets/select_gender.dart';
import 'package:kafill/features/register/presentation/widgets/skills.dart';

class CompleteDateScreen extends StatelessWidget {
  const CompleteDateScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppAssets.chooseImage,
                width: 83.w,
              )),
          verticalSpace(16.h),
          Text(
            "About",
            style: AppTextStyles.font12GreyMedium,
          ),
          verticalSpace(8.h),
          KafillTextFormField(maxLines: 5, validator: (val) {}),
          verticalSpace(16.h),
          Text(
            "Salary",
            style: AppTextStyles.font12GreyMedium,
          ),
          verticalSpace(8.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return Container(
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
                            child:  Text(
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
              );
            },
          ),
          verticalSpace(16),
          Text(
            "Birth Date",
            style: AppTextStyles.font12GreyMedium,
          ),
          verticalSpace(8),
          MyDatePicker(),
          verticalSpace(16),
          const GenderSelectionScreen(),
          verticalSpace(16),
          Skills(),
          verticalSpace(16),
          FavoriteSocialMediaScreen(
              socialMedia: context
                  .read<RegisterCubit>()
                  .dependenciesData!
                  .data
                  .socialMedia),
          verticalSpace(25),
          KafillButton(text: 'submit', onTap: () {}),
          verticalSpace(25),
        ],
      ),
    );
  }
}
