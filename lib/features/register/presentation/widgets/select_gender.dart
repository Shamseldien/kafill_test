import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  int selectedGender = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender",style: AppTextStyles.font12GreyMedium,),
        Row(
          children: [
            Row(
              children: [
                Radio(
                  visualDensity: const VisualDensity(horizontal: -4),
                  value: 1,
                  activeColor: AppColors.green,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                Text('Male',style: AppTextStyles.font14BlackBold,),
              ],
            ),
            SizedBox(width: 24.w,),
            Row(
              children: [
                Radio(
                  value: 2,
                  activeColor: AppColors.green,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),

                Text('Female',style: AppTextStyles.font14BlackBold,),
              ],
            ),


          ],
        ),
      ],
    );
  }
}