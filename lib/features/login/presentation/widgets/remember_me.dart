import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/login/cubit/login_cubit.dart';
class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
            activeColor: MaterialStateColor.resolveWith((states) => AppColors.green),
            value: context.read<LoginCubit>().isRememberMeValue, onChanged: (value){
              setState(() {
                context.read<LoginCubit>().isRememberMeValue = value!;
              });
        }),
        Text("Remember me",style: AppTextStyles.font12GreyMedium,)

      ],
    ) ;
  }
}
