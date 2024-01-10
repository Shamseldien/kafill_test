import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_assets.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';

class FavoriteSocialMediaScreen extends StatefulWidget {
  const FavoriteSocialMediaScreen({super.key,this.socialMedia= const []});

  final List<SocialMedia> socialMedia;
  @override
  _FavoriteSocialMediaScreenState createState() =>
      _FavoriteSocialMediaScreenState();
}

class _FavoriteSocialMediaScreenState
    extends State<FavoriteSocialMediaScreen> {
  Map<String, bool> selectedSocialMedia = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Favourite Social Media",style: AppTextStyles.font12GreyMedium,),
        verticalSpace(16),

        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.socialMedia.length,
          itemBuilder: (context, index) => buildSocialMediaRow(
            widget.socialMedia[index].label,
            widget.socialMedia[index].value,
            selectedSocialMedia.containsKey(widget.socialMedia[index].value)
                ? selectedSocialMedia[widget.socialMedia[index].value]!
                : false,
                (value) {
              setState(() {
                selectedSocialMedia[widget.socialMedia[index].value] = value!;
              });
            },
          ),
        ),

      ],
    );
  }

  Widget buildSocialMediaRow(
      String title, String icon, bool selected, ValueChanged<bool?> onChanged) {

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
         side: BorderSide(
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