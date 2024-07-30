// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_up_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopUpTransaction _$TopUpTransactionFromJson(Map<String, dynamic> json) {
  return _TopUpTransaction.fromJson(json);
}

/// @nodoc
mixin _$TopUpTransaction {
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  String? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'beneficiary')
  Beneficiary get beneficiary => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  String? get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopUpTransactionCopyWith<TopUpTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopUpTransactionCopyWith<$Res> {
  factory $TopUpTransactionCopyWith(
          TopUpTransaction value, $Res Function(TopUpTransaction) then) =
      _$TopUpTransactionCopyWithImpl<$Res, TopUpTransaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'timestamp') String? timestamp,
      @JsonKey(name: 'beneficiary') Beneficiary beneficiary,
      @JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'currency') String? currency});

  $BeneficiaryCopyWith<$Res> get beneficiary;
}

/// @nodoc
class _$TopUpTransactionCopyWithImpl<$Res, $Val extends TopUpTransaction>
    implements $TopUpTransactionCopyWith<$Res> {
  _$TopUpTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? timestamp = freezed,
    Object? beneficiary = null,
    Object? amount = null,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiary: null == beneficiary
          ? _value.beneficiary
          : beneficiary // ignore: cast_nullable_to_non_nullable
              as Beneficiary,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeneficiaryCopyWith<$Res> get beneficiary {
    return $BeneficiaryCopyWith<$Res>(_value.beneficiary, (value) {
      return _then(_value.copyWith(beneficiary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TopUpTransactionImplCopyWith<$Res>
    implements $TopUpTransactionCopyWith<$Res> {
  factory _$$TopUpTransactionImplCopyWith(_$TopUpTransactionImpl value,
          $Res Function(_$TopUpTransactionImpl) then) =
      __$$TopUpTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'timestamp') String? timestamp,
      @JsonKey(name: 'beneficiary') Beneficiary beneficiary,
      @JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'currency') String? currency});

  @override
  $BeneficiaryCopyWith<$Res> get beneficiary;
}

/// @nodoc
class __$$TopUpTransactionImplCopyWithImpl<$Res>
    extends _$TopUpTransactionCopyWithImpl<$Res, _$TopUpTransactionImpl>
    implements _$$TopUpTransactionImplCopyWith<$Res> {
  __$$TopUpTransactionImplCopyWithImpl(_$TopUpTransactionImpl _value,
      $Res Function(_$TopUpTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? timestamp = freezed,
    Object? beneficiary = null,
    Object? amount = null,
    Object? currency = freezed,
  }) {
    return _then(_$TopUpTransactionImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiary: null == beneficiary
          ? _value.beneficiary
          : beneficiary // ignore: cast_nullable_to_non_nullable
              as Beneficiary,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopUpTransactionImpl
    with DiagnosticableTreeMixin
    implements _TopUpTransaction {
  const _$TopUpTransactionImpl(
      {@JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'timestamp') required this.timestamp,
      @JsonKey(name: 'beneficiary') required this.beneficiary,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'currency') required this.currency});

  factory _$TopUpTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopUpTransactionImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'timestamp')
  final String? timestamp;
  @override
  @JsonKey(name: 'beneficiary')
  final Beneficiary beneficiary;
  @override
  @JsonKey(name: 'amount')
  final double amount;
  @override
  @JsonKey(name: 'currency')
  final String? currency;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopUpTransaction(transactionId: $transactionId, timestamp: $timestamp, beneficiary: $beneficiary, amount: $amount, currency: $currency)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopUpTransaction'))
      ..add(DiagnosticsProperty('transactionId', transactionId))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('beneficiary', beneficiary))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('currency', currency));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopUpTransactionImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.beneficiary, beneficiary) ||
                other.beneficiary == beneficiary) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, transactionId, timestamp, beneficiary, amount, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopUpTransactionImplCopyWith<_$TopUpTransactionImpl> get copyWith =>
      __$$TopUpTransactionImplCopyWithImpl<_$TopUpTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopUpTransactionImplToJson(
      this,
    );
  }
}

abstract class _TopUpTransaction implements TopUpTransaction {
  const factory _TopUpTransaction(
          {@JsonKey(name: 'transaction_id') required final String transactionId,
          @JsonKey(name: 'timestamp') required final String? timestamp,
          @JsonKey(name: 'beneficiary') required final Beneficiary beneficiary,
          @JsonKey(name: 'amount') required final double amount,
          @JsonKey(name: 'currency') required final String? currency}) =
      _$TopUpTransactionImpl;

  factory _TopUpTransaction.fromJson(Map<String, dynamic> json) =
      _$TopUpTransactionImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'timestamp')
  String? get timestamp;
  @override
  @JsonKey(name: 'beneficiary')
  Beneficiary get beneficiary;
  @override
  @JsonKey(name: 'amount')
  double get amount;
  @override
  @JsonKey(name: 'currency')
  String? get currency;
  @override
  @JsonKey(ignore: true)
  _$$TopUpTransactionImplCopyWith<_$TopUpTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
