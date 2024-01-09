import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';

class NumberStepper extends StatelessWidget {
  final double width;
  final totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
  final List<String> titles;
 const NumberStepper({
    Key? key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
    required this.titles,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalSpace(15.w),
              Text(titles[0],style: AppTextStyles.font13GreySemiBold.copyWith(
                  color:AppColors.green,
                  fontFamily: "Montserrat"

              ),),
              horizontalSpace(70.w),
              Text(titles[1],style: AppTextStyles.font13GreySemiBold.copyWith(
                  color: curStep>1 ? AppColors.green:AppColors.gray200,
                  fontFamily: "Montserrat"

              ),)
            ],
          ),
          verticalSpace(12.h),
          Row(
            children: _steps(),
          ),
        ],
      ),
    );
  }

  getCircleColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = AppColors.gray200;
    }
    return color;
  }

  getBorderColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = inactiveColor;
    }

    return color;
  }

  getLineColor(i) {
    var color =
        curStep >= i + 1 ? AppColors.green :AppColors.gray200;
    return color;
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      //colors according to state

      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);
      //line before step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(

            child: Container(
              height: lineWidth,
              color: lineColor,
            ),
          ),
        );
      }
      // step circles
      list.add(
        Container(
          width: 25.0,
          height: 25.0,
          decoration:   BoxDecoration(
            color: circleColor,
            borderRadius:   const BorderRadius.all(  Radius.circular(25.0)),
            border:   Border.all(
              color: borderColor,
              width: 1.0,
            ),
          ),
          child: getInnerElementOfStepper(i),
        ),
      );
      //line after step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            flex: 2,
            child: Container(
              height: lineWidth,
              color:curStep >1  ? lineColor :AppColors.gray200,
            ),
          ),
        );
      }
      //line after step circles
      if (i == totalSteps -1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color:  curStep >2  ? lineColor :AppColors.gray200
            ),
          ),
        );
      }
    }

    return list;
  }

  Widget getInnerElementOfStepper(index) {
    if (index + 1 < curStep) {
      return const Icon(
        Icons.check,
        color: Colors.white,
        size: 16.0,
      );
    } else if (index + 1 == curStep) {
      return Center(child: CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 11,
          child: Text(
            '$curStep',
            style: const TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

}
