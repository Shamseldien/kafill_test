import 'package:easy_stepper/easy_stepper.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/presentation/widgets/Stepper.dart';
class RegisterStepper extends StatefulWidget {
  const RegisterStepper({super.key});

  @override
  State<RegisterStepper> createState() => _RegisterStepperState();
}

class _RegisterStepperState extends State<RegisterStepper> {
    int currentStep = 1;

    int stepLength = 2;

    bool complete = false;

  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  @override
  Widget build(BuildContext context) {

    return NumberStepper(
      totalSteps: stepLength,
      width: MediaQuery.of(context).size.width,
      curStep: currentStep,
      stepCompleteColor: Colors.blue,
      currentStepColor: Color(0xffdbecff),
      inactiveColor: Color(0xffbababa),
      lineWidth: 3.5,
      titles: const [
        "Register",
        "Complete Data",
      ],
    );

    // return EasyStepper(
    //   activeStep: context.watch<RegisterCubit>().activeStep,
    //   finishedStepTextColor: AppColors.green,
    //   activeStepTextColor: AppColors.green,
    //   finishedStepBackgroundColor: Colors.transparent,
    //   internalPadding: 0,
    //   padding: EdgeInsets.zero,
    //   disableScroll: true,
    //   lineStyle: LineStyle(
    //     lineType: LineType.normal,
    //     defaultLineColor: AppColors.gray200,
    //     activeLineColor: AppColors.green,
    //     lineThickness: 2.w,
    //     lineLength: 100.w,
    //     lineSpace: 0,
    //     finishedLineColor: AppColors.green,
    //   ),
    //   showLoadingAnimation: false,
    //   stepRadius: 12,
    //   showStepBorder: false,
    //   fitWidth: true,
    //   steps: [
    //     const EasyStep(
    //       customStep: SizedBox(),
    //      ),
    //     EasyStep(
    //       customStep:  Container(
    //         width: 25.w,
    //         height: 25.w,
    //         alignment: Alignment.center,
    //         decoration: BoxDecoration(
    //           color:  context.watch<RegisterCubit>().activeStep >= 0 ? AppColors.green : Colors.white,
    //           shape: BoxShape.circle,
    //         ),
    //         child: CircleAvatar(
    //             radius: 10,
    //             backgroundColor: context.watch<RegisterCubit>().activeStep > 0 ? AppColors.green: Colors.white,
    //             child: context.watch<RegisterCubit>().activeStep > 0
    //                 ?  Icon(Icons.check,color: Colors.white,size: 15.w,)
    //                 : Text("1",style: AppTextStyles.font12BlackMedium.copyWith(
    //                 color: AppColors.green
    //             ),)),
    //       ),
    //       customTitle: Center(
    //         child: Text("Register",style: AppTextStyles.font12BlackMedium.copyWith(
    //           color: AppColors.green
    //         ),),
    //       ),
    //
    //       topTitle: true,
    //     ),
    //
    //     EasyStep(
    //       customStep:  Container(
    //         width: 25.w,
    //         height: 25.w,
    //         alignment: Alignment.center,
    //         decoration: BoxDecoration(
    //           color:  context.watch<RegisterCubit>().activeStep > 0 ? AppColors.green : AppColors.gray200,
    //           shape: BoxShape.circle,
    //         ),
    //         child:context.watch<RegisterCubit>().activeStep > 0
    //             ? CircleAvatar(
    //             radius: 10,
    //             backgroundColor:context.watch<RegisterCubit>().activeStep >= 2 ? AppColors.green : Colors.white,
    //             child:context.watch<RegisterCubit>().activeStep >= 2 ?  Icon(Icons.check,color: Colors.white,size: 15.w,) : Text("2",style: AppTextStyles.font12BlackMedium.copyWith(color: AppColors.green),))
    //             : const SizedBox(),
    //       ),
    //        topTitle: true,
    //       customTitle: Center(
    //         child: Text("Complete Data",style: AppTextStyles.font12BlackMedium.copyWith(
    //             color:context.watch<RegisterCubit>().activeStep > 1 ? AppColors.green : AppColors.gray300
    //         ),),
    //       ),
    //
    //     ),
    //     const EasyStep(
    //       customStep: SizedBox(),
    //     ),
    //
    //   ],
    //   // onStepReached: (index){
    //   //   print(index);
    //   //   setState(() =>  context.watch<RegisterCubit>().activeStep = index);
    //   // },
    // );
  }
}


