import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validation.g.dart';

@JsonSerializable()
class ValidationResponse {
  final bool taken;

  ValidationResponse({required this.taken});

  factory ValidationResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationResponseToJson(this);
}
