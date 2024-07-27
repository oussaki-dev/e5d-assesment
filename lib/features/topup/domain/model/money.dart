import 'package:freezed_annotation/freezed_annotation.dart';

part 'money.freezed.dart';
part 'money.g.dart';

@freezed
class Money with _$Money {

  const factory Money({
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'value') required String value,
  }) = _Money;

  factory Money.fromJson(Map<String, Object?> json) => _$MoneyFromJson(json);
}
