// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_up_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopUpTransactionImpl _$$TopUpTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$TopUpTransactionImpl(
      transactionId: json['transaction_id'] as String,
      timestamp: json['timestamp'] as String,
      beneficiary:
          Beneficiary.fromJson(json['beneficiary'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      currency: (json['currency'] as num).toDouble(),
    );

Map<String, dynamic> _$$TopUpTransactionImplToJson(
        _$TopUpTransactionImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'timestamp': instance.timestamp,
      'beneficiary': instance.beneficiary,
      'amount': instance.amount,
      'currency': instance.currency,
    };
