
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/presentation/widgets/Stepper.dart';

class RegisterStepper extends StatelessWidget {
  const RegisterStepper({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit,RegisterState>(
      builder:(context,staet)=> NumberStepper(
        totalSteps: 2,
        width: double.infinity,
        curStep: context.read<RegisterCubit>().activeStep,
        stepCompleteColor: AppColors.green,
        currentStepColor: AppColors.green,
        inactiveColor: AppColors.gray200,
        lineWidth: 2.7,
        titles: const [
          "Register",
          "Complete Data",
        ],
      ),
    );

  }
}


