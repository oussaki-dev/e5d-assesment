import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'firstName') required String? firstName,
    @JsonKey(name: 'lastName') required String? lastName,
    @JsonKey(name: 'token') required String? token,
    @JsonKey(name: 'refresh_token') required String? refreshToken,
    @JsonKey(name: 'is_verified') required bool? isVerified,
    @JsonKey(name: 'balance') required double? balance,
    @JsonKey(name: 'error_code') required String? errorCode,

    ///
    ///we need this transactions model to calculate
    ///the total
    ///
    @JsonKey(name: 'transactions') required List<TopUpTransaction>? transactions,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
