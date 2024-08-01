// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      isVerified: json['is_verified'] as bool?,
      balance: (json['balance'] as num?)?.toDouble(),
      errorCode: json['error_code'] as String?,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TopUpTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'is_verified': instance.isVerified,
      'balance': instance.balance,
      'error_code': instance.errorCode,
      'transactions': instance.transactions,
    };
