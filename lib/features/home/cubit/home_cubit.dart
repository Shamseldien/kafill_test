import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/features/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(currentIndex: 0));

  void changePage(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
