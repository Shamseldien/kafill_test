import 'package:flutter/material.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';

class EmailAndPass extends StatefulWidget {
  const EmailAndPass({super.key});

  @override
  State<EmailAndPass> createState() => _EmailAndPassState();
}

class _EmailAndPassState extends State<EmailAndPass> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email Address",style: AppTextStyles.font12GreyMedium,),
        verticalSpace(8),
        KafillTextFormField(
           validator: (value){

          },

        ),
        verticalSpace(16),
        Text("Password",style: AppTextStyles.font12GreyMedium,),
        verticalSpace(8),
        KafillTextFormField(
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

          },

        )
      ],
    );
  }
}
