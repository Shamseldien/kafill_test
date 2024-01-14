import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_assets.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
class RegisterError extends StatelessWidget {
  const RegisterError({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RegisterCubit,RegisterState>(
         builder: (context,state) {
         if(context.read<RegisterCubit>().registerScreenFieldIsEmpty){
           return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 32.h,
              color:AppColors.red.withOpacity(0.1),
              width: double.infinity,
              child: Row(
                children: [
                  horizontalSpace(20.w),
                  Image.asset(AppAssets.error,width: 20.w,),
                  horizontalSpace(8.w),
                  Text("Fill the required fields",style: AppTextStyles.font12GreyMedium.copyWith(
                      color:AppColors.red
                  ),)

                ],
              ),
            ),
            verticalSpace(20.h),
          ],
        );
        }else{
          return const SizedBox.shrink();
        }
         }
    );
  }
}
