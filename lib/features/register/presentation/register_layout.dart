import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/dependency_injecion/di.dart';
import 'package:kafill/core/helpers/app_navigation_extintion.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/routing/routers.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
import 'package:kafill/features/register/presentation/complete_data_screen.dart';
import 'package:kafill/features/register/presentation/register_screen.dart';
import 'package:kafill/features/register/presentation/widgets/regiser_error.dart';
import 'package:kafill/features/register/presentation/widgets/register_steper.dart';

class RegisterLayout extends StatelessWidget {
  const RegisterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state is LoadingState){
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
        }

        if (state is ErrorState) {
          context.pop();

          showDialog(
            context: context,
            builder: (context) =>  AlertDialog(
              actions: [
                TextButton(onPressed: (){
                  context.pop();
                }, child:Text("OK"))
              ],
              content: SizedBox(
                height: 200.h,
                width: 300.w,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.registerRequestError!.errors.length,
                  itemBuilder: (context, index) {
                    String key = state.registerRequestError!.errors.keys.toList()[index];
                    List<String> value =state.registerRequestError!.errors[key]!;

                    return ListTile(
                      title: Text('$key: ${value.join(", ")}'),

                    );
                  },
                ),
              ),
            ),

          );
        }

        if (state is SuccessState) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.loginScreen,  predicate: (route) => false);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(onPressed: (){
                  context.pop();
                  context.read<RegisterCubit>().disposeControllers();
                }, child:Text("OK"))
              ],
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(state.data!["status"] == 200 ?"successfully, now you can login": "some error occurred"),
                  ),
                ],
              ),
            ),
          );
        }
      },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              if (context.read<RegisterCubit>().registerPageController.page!.toInt() == 0) {
                context.read<RegisterCubit>().handelBackButton();
                return true;
              } else {
                context.read<RegisterCubit>().handelBackButton();
                return false;
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Register",
                  style: AppTextStyles.font18DarkBold,
                ),
              ),
              body:  Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RegisterError(),
                    const RegisterStepper(),
                    verticalSpace(25.w),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: context.read<RegisterCubit>().registerPageController,
                        children: const [
                          RegisterScreen(),
                        CompleteDateScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              )

            ),
          );
        }
    );
  }
}
