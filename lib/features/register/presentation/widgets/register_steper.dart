import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/theme/app_text_style.dart';
class RegisterSteper extends StatefulWidget {
    RegisterSteper({super.key,required this.activeStep});
  int activeStep = 0 ;

  @override
  State<RegisterSteper> createState() => _RegisterSteperState();
}

class _RegisterSteperState extends State<RegisterSteper> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: widget.activeStep,
       finishedStepTextColor: Colors.green,
      internalPadding: 0,
      disableScroll: true,
      lineStyle: LineStyle(
        lineType: LineType.normal,
        defaultLineColor: Colors.grey,
        activeLineColor: Colors.green,
        lineLength: 335.w / 3,
       ),
      showLoadingAnimation: false,
      stepRadius: 12,
      showStepBorder: false,
       fitWidth: true,
       steps: [
         const EasyStep(
           customLineWidget: SizedBox(),
           customStep: SizedBox(),
           icon:Icon(Icons.abc)
         ),
        EasyStep(
          customStep:  Container(
            width: 25.w,
            height: 25.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:  widget.activeStep >= 0 ? Colors.green : Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 10,
                backgroundColor: widget.activeStep > 0 ? Colors.green: Colors.white,
                child: widget.activeStep > 0
                    ?  Icon(Icons.check,color: Colors.white,size: 15.w,)
                    : Text("1",style: AppTextStyles.font12BlackMedium.copyWith(
                  color: Colors.green
                ),)),
          ),
          title: 'Register',
          topTitle: true,
        ),
        EasyStep(
          customStep: Container(
            width: 25.w,
           height: 25.w,
           alignment: Alignment.center,
           decoration: BoxDecoration(
             color:  widget.activeStep >= 1 ? Colors.green : Colors.white,
             shape: BoxShape.circle,
           ),
            child: Text("2",style: AppTextStyles.font12BlackMedium,),
          ),
          title: 'Complete Data',
          topTitle: true,
        ),

      const EasyStep(
           customStep: SizedBox(),

          ),
      ],
      onStepReached: (index) =>
          setState(() =>  widget.activeStep = index),
    );
  }
}
