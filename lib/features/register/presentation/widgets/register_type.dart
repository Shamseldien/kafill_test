import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
import 'package:kafill/features/splash/cubit/splash_cubit.dart';
 

class RegisterType extends StatelessWidget {
  const RegisterType({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context,state){},
      builder:(context,state)=> Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < context.read<SplashCubit>().dependenciesData!.data.types.length; i++)
            Row(
              children: [
                Radio(
                  value: i+1,
                  activeColor: AppColors.green,
                   groupValue: context.read<RegisterCubit>().selectedUserType,
                  onChanged: (int? newValue) {
                    context.read<RegisterCubit>().changeSelectedValueIndex(newValue!);
                  },
                ),
                Text(
                  context.read<SplashCubit>().dependenciesData!.data.types[i].label,
                  style: AppTextStyles.font14BlackBold,
                ),
                horizontalSpace(5.w)
              ],
            ),
        ],
      ),
    );
  }
}
