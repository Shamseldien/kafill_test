
abstract class SplashState {}
class SplashInitState extends SplashState{}
class SplashLoadingState  extends SplashState{}
class SplashErrorState  extends SplashState{
  final String error;
  SplashErrorState(this.error);

}
class SplashSuccessState  extends SplashState{}