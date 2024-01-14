import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponseBody {
 final int status;
 final bool success;
 dynamic data;

  RegisterResponseBody(
      {
        required this.success,
        required this.status,
        required this.data,
 });

    factory RegisterResponseBody.fromJson(Map<String, dynamic> json) =>
        _$RegisterResponseBodyFromJson(json);

    Map<String, dynamic> toJson() => _$RegisterResponseBodyToJson(this);

 }





