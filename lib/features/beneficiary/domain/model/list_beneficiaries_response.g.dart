// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_beneficiaries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeneficiariesResponseImpl _$$BeneficiariesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BeneficiariesResponseImpl(
      beneficiaries: (json['beneficiaries'] as List<dynamic>)
          .map((e) => Beneficiary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BeneficiariesResponseImplToJson(
        _$BeneficiariesResponseImpl instance) =>
    <String, dynamic>{
      'beneficiaries': instance.beneficiaries,
    };
