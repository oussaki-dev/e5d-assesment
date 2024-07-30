// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configurations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigurationsImpl _$$ConfigurationsImplFromJson(Map<String, dynamic> json) =>
    _$ConfigurationsImpl(
      baseUrl: json['baseUrl'] as String,
      deviceId: json['deviceId'] as String?,
      osVersion: json['osVersion'] as String?,
      environment: json['environment'] as String?,
      isRTL: json['isRTL'] as bool?,
      countryCode: json['countryCode'] as String?,
      languageCode: json['languageCode'] as String?,
      currency: json['currency'] as String?,
      appVersion: json['appVersion'] as String?,
      timestamp: json['timestamp'] as String?,
      deviceType: json['deviceType'] as String?,
      refreshToken: json['refreshToken'] as String?,
      token: json['token'] as String?,
      transactionFee: (json['transactionFee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ConfigurationsImplToJson(
        _$ConfigurationsImpl instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'deviceId': instance.deviceId,
      'osVersion': instance.osVersion,
      'environment': instance.environment,
      'isRTL': instance.isRTL,
      'countryCode': instance.countryCode,
      'languageCode': instance.languageCode,
      'currency': instance.currency,
      'appVersion': instance.appVersion,
      'timestamp': instance.timestamp,
      'deviceType': instance.deviceType,
      'refreshToken': instance.refreshToken,
      'token': instance.token,
      'transactionFee': instance.transactionFee,
    };
