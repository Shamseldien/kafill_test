 import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/core/helpers/app_navigation_extintion.dart';
import 'package:kafill/core/routing/app_router.dart';
import 'package:kafill/core/routing/routers.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
 import 'package:kafill/features/splash/cubit/splash_state.dart';
import 'package:kafill/features/splash/repositories/splash_repo.dart';



class SplashCubit extends Cubit<SplashState> {
  final SplashRepo _splashRepo;
  SplashCubit(this._splashRepo) : super(SplashInitState());
  DependenciesModel? dependenciesData;

  Future<void> getDependencies() async {
    emit(SplashLoadingState());
    final response = await _splashRepo.getDependencies();
    response.when(success: (dependenciesResponse) {
      dependenciesData = dependenciesResponse;

      emit(SplashSuccessState());
    }, failure: (error) {
      emit(SplashErrorState( error));
    },
    );
  }
}
