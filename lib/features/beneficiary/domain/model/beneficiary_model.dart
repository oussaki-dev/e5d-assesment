import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beneficiary_model.freezed.dart';
part 'beneficiary_model.g.dart';

@freezed
class Beneficiary with _$Beneficiary {
  const factory Beneficiary({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'nickname') required String? nickname,
    @JsonKey(name: 'mobileNumber') required String? mobileNumber,
  }) = _Beneficiary;

  factory Beneficiary.fromJson(Map<String, Object?> json) =>
      _$BeneficiaryFromJson(json);
}
