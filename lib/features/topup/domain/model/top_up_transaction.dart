import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_up_transaction.freezed.dart';
part 'top_up_transaction.g.dart';

@freezed
class TopUpTransaction with _$TopUpTransaction {
  const factory TopUpTransaction(
      {@JsonKey(name: 'transaction_id') required String transactionId,
      @JsonKey(name: 'timestamp') required String timestamp,
      @JsonKey(name: 'beneficiary') required Beneficiary beneficiary,
      @JsonKey(name: 'amount') required double amount,
      @JsonKey(name: 'currency') required double currency}) = _TopUpTransaction;

  factory TopUpTransaction.fromJson(Map<String, Object?> json) =>
      _$TopUpTransactionFromJson(json);
}
