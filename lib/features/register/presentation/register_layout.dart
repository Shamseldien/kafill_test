import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/presentation/complete_data_screen.dart';
import 'package:kafill/features/register/presentation/register_screen.dart';
import 'package:kafill/features/register/presentation/widgets/regiser_error.dart';
import 'package:kafill/features/register/presentation/widgets/register_loading_listner.dart';
import 'package:kafill/features/register/presentation/widgets/register_steper.dart';

class RegisterLayout extends StatefulWidget {
  const RegisterLayout({Key? key}) : super(key: key);

  @override
  State<RegisterLayout> createState() => _RegisterLayoutState();
}

class _RegisterLayoutState extends State<RegisterLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return WillPopScope(
      onWillPop: () async {
        context.read<RegisterCubit>().changeActiveStep(1);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Register",
            style: AppTextStyles.font18DarkBold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (context.read<RegisterCubit>().areFieldsEmpty)
                const RegisterError(),

              const  RegisterStepper(),
              verticalSpace(25.w),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller:
                  context.read<RegisterCubit>().registerPageController,
                  children:const [
                    RegisterScreen(),
                    CompleteDateScreen(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  },
);
  }
}
