import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'firstName') required String? firstName,
    @JsonKey(name: 'lastName') required String? lastName,
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'refreshToken') required String refreshToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
