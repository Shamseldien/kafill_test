import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/core/helpers/app_navigation_extintion.dart';
import 'package:kafill/core/routing/routers.dart';
 import 'package:kafill/core/theme/app_text_style.dart';
 import 'package:kafill/features/splash/cubit/splash_cubit.dart';
import 'package:kafill/features/splash/cubit/splash_state.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
     return BlocConsumer<SplashCubit,SplashState>(
      listener: (context,state){
        if(state is SplashSuccessState){

          if (state.userToken != null) {
            context.pushNamedAndRemoveUntil(
                Routes.homeScreen, predicate: (route) => false);
          } else {
            context.pushNamedAndRemoveUntil(
                Routes.loginScreen, predicate: (route) => false);
          }
        }else if(state is SplashErrorState){
          
          showDialog(
              context: context,
              builder: (context)=> AlertDialog(
                title: Text(state.error),
                content: Text(state.error),
                actions: [
                  TextButton(
                    onPressed: (){
                       context.pop();
                    },
                    child:const Text("Ok"))
                ],
              )
          );
        }
      },
      builder: (context,state) {
        return Scaffold(
          body: Center(
            child: Text("Kafill",style:AppTextStyles.font18DarkBold),
          ),
        );
      }
    );
  }
}
