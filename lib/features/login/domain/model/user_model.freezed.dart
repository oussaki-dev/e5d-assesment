// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_code')
  String? get errorCode => throw _privateConstructorUsedError;

  ///
  ///we need this transactions model to calculate
  ///the total
  ///
  @JsonKey(name: 'transactions')
  List<TopUpTransaction>? get transactions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'firstName') String? firstName,
      @JsonKey(name: 'lastName') String? lastName,
      @JsonKey(name: 'token') String? token,
      @JsonKey(name: 'refresh_token') String? refreshToken,
      @JsonKey(name: 'is_verified') bool? isVerified,
      @JsonKey(name: 'balance') double? balance,
      @JsonKey(name: 'error_code') String? errorCode,
      @JsonKey(name: 'transactions') List<TopUpTransaction>? transactions});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? isVerified = freezed,
    Object? balance = freezed,
    Object? errorCode = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TopUpTransaction>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'firstName') String? firstName,
      @JsonKey(name: 'lastName') String? lastName,
      @JsonKey(name: 'token') String? token,
      @JsonKey(name: 'refresh_token') String? refreshToken,
      @JsonKey(name: 'is_verified') bool? isVerified,
      @JsonKey(name: 'balance') double? balance,
      @JsonKey(name: 'error_code') String? errorCode,
      @JsonKey(name: 'transactions') List<TopUpTransaction>? transactions});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? isVerified = freezed,
    Object? balance = freezed,
    Object? errorCode = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_$UserModelImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TopUpTransaction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl with DiagnosticableTreeMixin implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: 'firstName') required this.firstName,
      @JsonKey(name: 'lastName') required this.lastName,
      @JsonKey(name: 'token') required this.token,
      @JsonKey(name: 'refresh_token') required this.refreshToken,
      @JsonKey(name: 'is_verified') required this.isVerified,
      @JsonKey(name: 'balance') required this.balance,
      @JsonKey(name: 'error_code') this.errorCode,
      @JsonKey(name: 'transactions')
      required final List<TopUpTransaction>? transactions})
      : _transactions = transactions;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'token')
  final String? token;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @override
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  @override
  @JsonKey(name: 'balance')
  final double? balance;
  @override
  @JsonKey(name: 'error_code')
  final String? errorCode;

  ///
  ///we need this transactions model to calculate
  ///the total
  ///
  final List<TopUpTransaction>? _transactions;

  ///
  ///we need this transactions model to calculate
  ///the total
  ///
  @override
  @JsonKey(name: 'transactions')
  List<TopUpTransaction>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(firstName: $firstName, lastName: $lastName, token: $token, refreshToken: $refreshToken, isVerified: $isVerified, balance: $balance, errorCode: $errorCode, transactions: $transactions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('refreshToken', refreshToken))
      ..add(DiagnosticsProperty('isVerified', isVerified))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('errorCode', errorCode))
      ..add(DiagnosticsProperty('transactions', transactions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      token,
      refreshToken,
      isVerified,
      balance,
      errorCode,
      const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: 'firstName') required final String? firstName,
      @JsonKey(name: 'lastName') required final String? lastName,
      @JsonKey(name: 'token') required final String? token,
      @JsonKey(name: 'refresh_token') required final String? refreshToken,
      @JsonKey(name: 'is_verified') required final bool? isVerified,
      @JsonKey(name: 'balance') required final double? balance,
      @JsonKey(name: 'error_code') final String? errorCode,
      @JsonKey(name: 'transactions')
      required final List<TopUpTransaction>? transactions}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: 'firstName')
  String? get firstName;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName;
  @override
  @JsonKey(name: 'token')
  String? get token;
  @override
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @override
  @JsonKey(name: 'is_verified')
  bool? get isVerified;
  @override
  @JsonKey(name: 'balance')
  double? get balance;
  @override
  @JsonKey(name: 'error_code')
  String? get errorCode;
  @override

  ///
  ///we need this transactions model to calculate
  ///the total
  ///
  @JsonKey(name: 'transactions')
  List<TopUpTransaction>? get transactions;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
