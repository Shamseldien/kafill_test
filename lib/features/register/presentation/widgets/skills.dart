 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kafill/core/dependency_injecion/di.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';

class  Skills  extends StatefulWidget{
  const Skills({super.key,required this.options});
  final List<Tag>  options;

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text("Skills",style: AppTextStyles.font12GreyMedium,),
        verticalSpace(8),
        GestureDetector(
          onTap: ()=>showSkillsDialog(context, widget.options),
          child: Container(
            height:115.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.gray50
              ),

            child: context.read<RegisterCubit>().selectedSkills.isEmpty
                ? const SizedBox.shrink() : Wrap(
              children: [
                for (final tag in context.read<RegisterCubit>().selectedSkills)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Chip(
                      label: Text(tag.label,style: AppTextStyles.font12GreyMedium.copyWith(
                        color: AppColors.green
                      ),),
                      deleteIcon: const Icon(Icons.close,color: AppColors.green,),
                      //onDeleted: () => setState(() => context.read<RegisterCubit>().selectedSkills.remove(tag)),
                    ),
                  ),
        ]    ),),)

      ],
    );
  }

  void showSkillsDialog(BuildContext context, List<Tag> options) {
    showDialog(
      context: context,
      builder: (context) => TypesList(options: options),
    );
  }


}


 class TypesList extends StatefulWidget {
   const TypesList({Key? key, required this.options}) : super(key: key);
   final List<Tag> options;

   @override
   State<TypesList> createState() => _TypesListState();
 }

 class _TypesListState extends State<TypesList> {
   int itemsPerPage = 10;
   int currentPage = 1;
   bool isLoading = false;
   ScrollController _scrollController = ScrollController();

   @override
   void initState() {
     super.initState();
     _scrollController.addListener(() {
       if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoading) {
         loadMoreItems();
       }
     });
   }

   void loadMoreItems() {
     setState(() {
       isLoading = true;
       currentPage++;
     });

     Future.delayed(Duration(seconds: 2), () {
       setState(() {
         widget.options.addAll(getMoreItems());
         isLoading = false;
       });
     });
   }

   List<Tag> getMoreItems() {
     return List.generate(itemsPerPage, (index) => Tag(
       label: widget.options[widget.options.length + index + 1].label,
       value: widget.options[widget.options.length + index + 1].value,
     ));
   }

   @override
   Widget build(BuildContext context) {
     return Center(
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Container(
             height: MediaQuery.of(context).size.height * 0.6,
             width: MediaQuery.of(context).size.width * 0.9,
             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               color: Colors.grey[200], // Replace with your color
             ),
             child: GridView.builder(
               controller: _scrollController,
               itemCount: widget.options.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 15.0,
                 mainAxisSpacing: 15.0,
                 childAspectRatio: 3.5,
               ),
               itemBuilder: (context, index) {
                 return GestureDetector(
                   onTap: () {

                   },
                   child: Container(
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       color:   AppColors.green.withOpacity(0.1),
                       borderRadius: BorderRadius.circular(16),
                     ),
                     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                     child: Text(
                       widget.options[index].label,
                       style: AppTextStyles.font14BlackBold.copyWith(
                         color:   AppColors.green,
                       ),
                     ),
                   ),
                 );
               },
             ),
           ),
         ],
       ),
     );
   }
 }




