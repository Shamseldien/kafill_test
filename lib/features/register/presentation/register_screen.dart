import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
 import 'package:kafill/features/register/presentation/widgets/first_and_last_name.dart';
import 'package:kafill/features/register/presentation/widgets/password_and_confirm_password.dart';
  import 'package:kafill/features/register/presentation/widgets/register_type.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key,required this.dependenciesModel}) : super(key: key);
  final DependenciesModel dependenciesModel ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FirstAndLastName(),
          verticalSpace(16.h),
          Text(
            "Email Address",
            style: AppTextStyles.font12GreyMedium,
          ),
          verticalSpace(8.h),
          KafillTextFormField(
              controller:
              context.read<RegisterCubit>().emailController,
              validator: (String? value) {}),
          verticalSpace(16.h),
          const RegisterPassAndConfirmPass(),
          verticalSpace(16.h),
          Text("User Type", style: AppTextStyles.font12GreyMedium),
          verticalSpace(8.h),
          RegisterType(types:dependenciesModel.data.types),
          verticalSpace(56.h),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: KafillButton(
              width: 160.w,
              onTap: () {
                context.read<RegisterCubit>().checkFieldsStatus();


              },
              text: 'Next',
            ),
          ),
         // const RegisterLoadingListener()
        ],
      ),
    );
  }
}

