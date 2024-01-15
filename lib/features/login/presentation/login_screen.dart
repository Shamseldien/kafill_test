import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_navigation_extintion.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/routing/app_router.dart';
import 'package:kafill/core/routing/routers.dart';
import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/login/cubit/login_cubit.dart';
import 'package:kafill/features/login/cubit/login_state.dart';
import 'package:kafill/features/login/data/models/login_request_body.dart';
import 'package:kafill/features/login/presentation/widgets/email_and_pass.dart';
import 'package:kafill/features/login/presentation/widgets/remember_me.dart';

import 'widgets/dont_have_account_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Login",style: AppTextStyles.font18DarkBold.copyWith(
         fontFamily:  "Montserrat"
        ),),
      ),
      body:   BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){

          if(state is LoginLoading){
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          }


          if(state is LoginSuccess){
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.homeScreen,predicate:  (route) => false);
           }

          if(state is LoginError){
            context.pop();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.loginRequestError.message ?? state.loginRequestError.errors),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        builder:(context,state)=> SingleChildScrollView(
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/login_image.png",width: 255.w,)),
                const  EmailAndPass(),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const  RememberMe(),
                    Text("Forgot Password?",style: AppTextStyles.font12GreyMedium,)

                  ],
                ),
                verticalSpace(34),
                KafillButton(
                  onTap:  () {

                    if(context.read<LoginCubit>().formKey.currentState!.validate()){
                      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
                          email: context.read<LoginCubit>().emailController.text,
                          password: context.read<LoginCubit>().passwordController.text
                      ));
                    }

                },
                  text: 'Login',
                ),

                verticalSpace(24),


               const DontHaveAccountText()
              ],
            ),
          ),
        ),
      ),

    );
  }
}
