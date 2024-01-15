
abstract class WhoAmIState {}
class WhoAmIStateInitial extends WhoAmIState {}
class WhoAmIStateLoading extends WhoAmIState {}
class WhoAmIStateSuccess extends WhoAmIState {}
class WhoAmIStateError extends WhoAmIState {
  final String message;
  WhoAmIStateError({required this.message});
}