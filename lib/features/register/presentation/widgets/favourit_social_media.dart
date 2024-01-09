import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_assets.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/colors.dart';

class FavoriteSocialMediaScreen extends StatefulWidget {
  const FavoriteSocialMediaScreen({super.key});

  @override
  _FavoriteSocialMediaScreenState createState() =>
      _FavoriteSocialMediaScreenState();
}

class _FavoriteSocialMediaScreenState
    extends State<FavoriteSocialMediaScreen> {
  bool facebookSelected = false;
  bool twitterSelected = false;
  bool linkedInSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          buildSocialMediaRow('Facebook', AppAssets.facebook, facebookSelected,
                  (value) {
                setState(() {
                  facebookSelected = value!;
                });
              }),
          buildSocialMediaRow('Twitter', AppAssets.twitter, twitterSelected,
                  (value) {
                setState(() {
                  twitterSelected = value!;
                });
              }),
          buildSocialMediaRow('LinkedIn',AppAssets.linkedIn, linkedInSelected,
                  (value) {
                setState(() {
                  linkedInSelected = value!;
                });
              }),

        ],
      ),
    );
  }

  Widget buildSocialMediaRow(
      String title, String icon, bool selected, ValueChanged<bool?> onChanged) {
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
        Image.asset(icon,width: 22.w,),
        horizontalSpace(8.w),
        Text(title),
      ],
    );
  }
}