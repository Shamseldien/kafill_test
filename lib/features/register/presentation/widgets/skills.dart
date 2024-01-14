import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/dependency_injecion/di.dart';
import 'package:kafill/core/helpers/app_navigation_extintion.dart';
import 'package:kafill/core/helpers/app_spacer.dart';
import 'package:kafill/core/shared_widgets/kafill_button.dart';
import 'package:kafill/core/theme/app_text_style.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:kafill/features/splash/cubit/splash_cubit.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key,}) : super(key: key);
  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  int itemsPerPage = 10;
  int currentPage = 1;
  bool isLoading = false;
  ScrollController   _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();


    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !isLoading) {
        loadMoreItems();
      }
    });
  }

  void loadMoreItems() {
    setState(() {
      isLoading = true;
      currentPage++;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        context.read<SplashCubit>()
            .dependenciesData!.data.tags.addAll(getMoreItems());
        isLoading = false;
      });
    });
  }

  List<Tag> getMoreItems() {
    return List.generate(
        itemsPerPage,
        (index) => Tag(
              label:context.read<SplashCubit>()
                  .dependenciesData!.data.tags[context.read<SplashCubit>()
                  .dependenciesData!.data.tags.length + index + 1].label,
              value:context.read<SplashCubit>()
                  .dependenciesData!.data.tags[context.read<SplashCubit>()
                  .dependenciesData!.data.tags.length + index + 1].value,
            ));
  }

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<RegisterCubit,RegisterState>(
       listener: (context,state){},
       builder:(context,state)=> Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skills", style: AppTextStyles.font12GreyMedium),
          verticalSpace(8),
          GestureDetector(
            onTap: () {
              context.read<RegisterCubit>().showSkillsDialog(
                  context,TagsList(options:context.read<SplashCubit>().dependenciesData!.data.tags));
            },
            child: Container(
              height: 115.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.gray50,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 3.0,
                    childAspectRatio: 4,
                  ),
                  itemCount: context.read<RegisterCubit>().selectedSkills.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.green.withOpacity(0.1)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            context.read<RegisterCubit>()
                                .selectedSkills[index]
                                .label,
                            style: AppTextStyles.font12GreyMedium
                                .copyWith(color: AppColors.green),
                          ),
                          GestureDetector(
                              onTap: () {
                                context.read<RegisterCubit>().removeTag(
                                    context
                                        .read<RegisterCubit>()
                                        .selectedSkills[index]);
                              },
                              child: const Icon(Icons.close,
                                  color: AppColors.green))
                        ],
                      ),
                    ),
                  ))
            ),
          ),
        ],
    ),
     );
  }


}

class TagsList extends StatefulWidget {
  const TagsList({Key? key, required this.options}) : super(key: key);
  final List<Tag> options;

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  int itemsPerPage = 10;
  int currentPage = 1;
  bool isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !isLoading) {
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
    return List.generate(
        itemsPerPage,
        (index) => Tag(
              label: widget.options[widget.options.length + index + 1].label,
              value: widget.options[widget.options.length + index + 1].value,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer  <RegisterCubit,RegisterState>(
      listener: (context,state){},
      builder: (context,state)=>Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.9,
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[200], // Replace with your color
              ),
              child: GridView.builder(
                controller: _scrollController,
                itemCount: widget.options.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 3.5,
                ),
                itemBuilder: (context, index) {
                  // final selectedSkills = context.read<RegisterCubit>().selectedSkills;
                   final tag = widget.options[index];
                 //  final isSelected = selectedSkills.contains(tag);

                  return GestureDetector(
                    onTap: () {
                      if (context.read<RegisterCubit>().selectedSkills.contains(widget.options[index])) {
                        context.read<RegisterCubit>().removeTag(widget.options[index]);
                      } else {
                        context.read<RegisterCubit>().addTag(widget.options[index]);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.read<RegisterCubit>().selectedSkills.contains(widget.options[index])
                            ? AppColors.green.withOpacity(0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text(
                        tag.label,
                        style: AppTextStyles.font14BlackBold.copyWith(
                          color:
                          context.read<RegisterCubit>().selectedSkills.contains(widget.options[index]) ? AppColors.green : Colors.black,
                        ),

                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
