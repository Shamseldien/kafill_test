import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';

class RegisterType extends StatefulWidget {
  const RegisterType({super.key,required this.types});
  final List<Type>?  types;

  @override
  _RegisterTypeState createState() => _RegisterTypeState();
}

class _RegisterTypeState extends State<RegisterType> {
 // List<String> radioItems = ['Seller', 'Buyer', 'Both'];
  int? selectedValueIndex; // Default selected value is null
  bool showDropdown = true;

  @override
  Widget build(BuildContext context) {
    return showDropdown
        ? Container(
            width: double.infinity,
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColors.gray50,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: DropdownButton<int?>(
              underline: const SizedBox.shrink(),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.gray300,
              ),
              isExpanded: true,
              value: selectedValueIndex,
              items: [
                for (int i = 0; i < widget.types!.length; i++)
                  DropdownMenuItem<int?>(
                    value: i,
                    child: Text(
                      widget.types![i].label,
                      style: AppTextStyles.font14BlackBold,
                    ),
                  ),
              ],
              onChanged: (int? newValue) {
                setState(() {
                  selectedValueIndex = newValue;
                  showDropdown = false;
                });
              },
            ))
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < widget.types!.length; i++)
                Row(
                  children: [
                    Radio(
                      value: i,
                      activeColor: AppColors.green,
                     // fillColor:MaterialStateProperty.resolveWith((states) =>  AppColors.green),
                      groupValue: selectedValueIndex,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedValueIndex = newValue;
                        });
                      },
                    ),
                    Text(
                      widget.types![i].label,
                      style: AppTextStyles.font14BlackBold,
                    ),
                    horizontalSpace(5.w)
                  ],
                ),
            ],
          );
  }
}
