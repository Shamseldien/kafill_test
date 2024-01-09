import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'who_am_i_state.dart';
part 'who_am_i_cubit.freezed.dart';

class WhoAmICubit extends Cubit<WhoAmIState> {
  WhoAmICubit() : super(const WhoAmIState.initial());
}
