
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/core/dependency_injecion/di.dart';
import 'package:kafill/core/helpers/caching_helper.dart';
import 'package:kafill/features/whoAmI/cubit/who_am_i_state.dart';
import 'package:kafill/features/whoAmI/data/repositories/who_am_i_repo.dart';

class WhoAmICubit extends Cubit<WhoAmIState> {
  final WhoAmIRepo _whoAmIRepo;
  WhoAmICubit(this._whoAmIRepo) : super(WhoAmIStateInitial());

  void getWhoAmI() async {
    emit(WhoAmIStateLoading());
    try {
      final data = await _whoAmIRepo.getWhoAmI(await getToken());

      //emit(WhoAmIStateSuccess(data));
    } catch (e) {
      emit(WhoAmIStateError(message: e.toString()));
    }
  }

  Future<String?> getToken() async{
    return  await getIt<CacheManager>().getCachedData<String>('token',(json)=>json['data']);
  }

}
