import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_beneficiaries_response.freezed.dart';
part 'list_beneficiaries_response.g.dart';

@freezed
class BeneficiariesResponse with _$BeneficiariesResponse {
  const factory BeneficiariesResponse({
    @JsonKey(name: 'beneficiaries') required List<Beneficiary> beneficiaries,
  }) = _BeneficiariesResponse;

  factory BeneficiariesResponse.fromJson(Map<String, Object?> json) =>
      _$BeneficiariesResponseFromJson(json);
}
