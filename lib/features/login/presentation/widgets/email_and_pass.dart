import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/core/helpers/app_regex.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/features/login/cubit/login_state.dart';

import '../../cubit/login_cubit.dart';

class EmailAndPass extends StatefulWidget {
  const EmailAndPass({super.key});

  @override
  State<EmailAndPass> createState() => _EmailAndPassState();
}

class _EmailAndPassState extends State<EmailAndPass> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key:context.read<LoginCubit>().formKey ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email Address",style: AppTextStyles.font12GreyMedium,),
          verticalSpace(8),
          KafillTextFormField(
            controller: context.read<LoginCubit>().emailController,
            validator: (value){
              if(value!.isEmpty || !AppRegex.isEmailValid(value)){
                return "Email is invalid";
              }
              return null;

            },

          ),
          verticalSpace(16),
          Text("Password",style: AppTextStyles.font12GreyMedium,),
          verticalSpace(8),
          KafillTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            isObscureText: isObscureText,
            suffixIcon:GestureDetector(
              onTap: (){
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value){
              if(value!.isEmpty){
                return "Password is required";
              }
              return null;
            },

          )
        ],
      ),
    );
  }
}
