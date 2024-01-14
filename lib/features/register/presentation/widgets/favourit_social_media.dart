import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_assets.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';


class FavoriteSocialMediaScreen extends StatelessWidget {
  const FavoriteSocialMediaScreen({super.key,required this.socialMedia});
  final List<SocialMedia>? socialMedia ;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context,state){},
      builder:(context,state)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Favourite Social Media",style: AppTextStyles.font12GreyMedium,),
          verticalSpace(16),


          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: socialMedia!.length,
            itemBuilder: (context, index) => buildSocialMediaRow(
            title:  socialMedia![index].label,
            icon:  socialMedia![index].value,
            selected: context.read<RegisterCubit>().selectedSocialMedia.contains(socialMedia![index]) ? true : false,
             onChanged:(value) {
                    context.read<RegisterCubit>().changeSelectedSocialMedia(socialMedia![index]);
              },
            ),
          ),

        ],
      ),
    );
  }

  Widget buildSocialMediaRow(
      {required String title,
     required String icon,
      required bool selected,
  required    ValueChanged<bool?> onChanged}) {

    String _icon='';
    switch(icon){
      case 'facebook':
        _icon = AppAssets.facebook;
        break;
      case 'x':
        _icon = AppAssets.twitter;
        break;
      case 'instagram':
        _icon = AppAssets.instagram;
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          visualDensity: const VisualDensity(horizontal: -4),
          checkColor: AppColors.white,
         side:const  BorderSide(
           color: AppColors.gray300
         ),
          fillColor: MaterialStateProperty.resolveWith((states) => AppColors.green),
          value: selected,
          onChanged: onChanged,
        ),
        horizontalSpace(12.w),
        Image.asset(_icon,width: 22.w,),
        horizontalSpace(8.w),
        Text(title),
      ],
    );
  }
}