import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/helpers/app_assets.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/shared_widgets/kafill_text_form_field.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/presentation/widgets/favourit_social_media.dart';
 import 'package:kafill/features/register/presentation/widgets/select_gender.dart';
class WhoAmI extends StatelessWidget {
  const WhoAmI({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(AppAssets.chooseImage,width: 83.w,)),
          verticalSpace(16.h),
          Text("About",style: AppTextStyles.font12GreyMedium,),
          verticalSpace(8.h),
          KafillTextFormField(
              maxLines: 5,
              validator: (val){}),
          verticalSpace(16.h),
          Text("Salary",style: AppTextStyles.font12GreyMedium,),
          verticalSpace(8.h),
          Container(
            height: 56.h,
            decoration: BoxDecoration(
                color: AppColors.gray50,
                borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.symmetric(horizontal: 41.w),
            child: Row(
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.remove,color: AppColors.green,size: 15,))),
                ),
                Expanded(child: Center(child: Text("SAR 1000",style:AppTextStyles.font16Grey800Medium,))),
                SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: AppColors.green,size: 15,))),
                ),              ],
            ),
          ),
          verticalSpace(16.h),
          Text("Birth Date",style: AppTextStyles.font12GreyMedium,),
          verticalSpace(8.h),

          verticalSpace(16.h),

          const GenderSelectionScreen(),
          verticalSpace(16.h),
          Text("Skills",style: AppTextStyles.font12GreyMedium,),
          verticalSpace(8.h),
          Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.gray50
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.green.withOpacity(0.1)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text("Video Production",style: AppTextStyles.font12GreyMedium.copyWith(
                              color: AppColors.green
                          ),),
                        ),
                        Icon(Icons.close,color: AppColors.green,)
                      ],
                    ),
                  ),
                ),
                horizontalSpace(8.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.green.withOpacity(0.1)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text("Video Production",style: AppTextStyles.font12GreyMedium.copyWith(
                              color: AppColors.green
                          ),),
                        ),
                        Icon(Icons.close,color: AppColors.green,)
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          verticalSpace(16.h),
          Text("Favourite Social Media",style: AppTextStyles.font12GreyMedium,),
          verticalSpace(8.h),
          const FavoriteSocialMediaScreen(socialMedia: [],),
          verticalSpace(25.h),
          KafillButton(text: 'submit', onTap: (){}),
          verticalSpace(25.h),
        ],
      ),
    );
  }
}
