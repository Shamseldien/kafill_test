import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_res.freezed.dart';

@Freezed()
abstract class ApiResults<T> with _$ApiResults<T> {
  const factory ApiResults.success(T data) = Success<T>;
  const factory ApiResults.failure(String errorHandler) = Failure<T>;
}
