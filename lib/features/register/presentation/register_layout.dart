import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:kafill/features/register/presentation/complete_data_screen.dart';
import 'package:kafill/features/register/presentation/register_screen.dart';
import 'package:kafill/features/register/presentation/widgets/regiser_error.dart';
import 'package:kafill/features/register/presentation/widgets/register_loading_listner.dart';
import 'package:kafill/features/register/presentation/widgets/register_steper.dart';

class RegisterLayout extends StatelessWidget {
  const RegisterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit,RegisterState>(
      builder:(context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Register",
              style: AppTextStyles.font18DarkBold,
            ),
          ),
          body:state is! Error && state is! Loading
              ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterError(),
                const RegisterStepper(),
                verticalSpace(25.w),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: context.read<RegisterCubit>().registerPageController,
                    children: [
                      RegisterScreen(
                          dependenciesModel: context
                              .read<RegisterCubit>()
                              .dependenciesData!),
                        CompleteDateScreen(dependenciesModel: context
                          .read<RegisterCubit>()
                          .dependenciesData!),
                    ],
                  ),
                ),
              ],
            ),
          )
              : const Center(child: CircularProgressIndicator(),),
        );
      }
    );
}
}
