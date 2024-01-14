import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/cubit/register_state.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context,state){},
      builder:(context,state)=> Column(
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
                    groupValue: context.read<RegisterCubit>().selectedGender?? false,
                    onChanged: (value) {
                      context.read<RegisterCubit>().changeGender(value as int);
                    },
                  ),
                  Text('Male',style: AppTextStyles.font14BlackBold,),
                ],
              ),
              SizedBox(width: 24.w,),
              Row(
                children: [
                  Radio(
                    value: 0,
                    activeColor: AppColors.green,
                    groupValue:  context.read<RegisterCubit>().selectedGender ?? false,
                    onChanged: (value) {
                      context.read<RegisterCubit>().changeGender(value as int);
                    },
                  ),

                  Text('Female',style: AppTextStyles.font14BlackBold,),
                ],
              ),


            ],
          ),
        ],
      ),
    );
  }
}