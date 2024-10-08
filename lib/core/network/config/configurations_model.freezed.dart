// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configurations_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Configurations _$ConfigurationsFromJson(Map<String, dynamic> json) {
  return _Configurations.fromJson(json);
}

/// @nodoc
mixin _$Configurations {
  String get baseUrl => throw _privateConstructorUsedError;

  /// Device
  String? get deviceId => throw _privateConstructorUsedError;
  String? get osVersion => throw _privateConstructorUsedError;
  String? get environment => throw _privateConstructorUsedError;
  bool? get isRTL => throw _privateConstructorUsedError;

  /// Location
  String? get countryCode => throw _privateConstructorUsedError;
  String? get languageCode => throw _privateConstructorUsedError;

  /// App
  String? get currency => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  String? get deviceType => throw _privateConstructorUsedError;

  /// Authentication
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get token =>
      throw _privateConstructorUsedError; // other configurations
  double? get transactionFee =>
      throw _privateConstructorUsedError; // how mush is the transaction fee
  double? get verifiedTopUpThreshold =>
      throw _privateConstructorUsedError; // AED 1000
  double? get nonVerifiedTopUpThreshold =>
      throw _privateConstructorUsedError; // AED 500
  double? get monthlyMaxTopUpThreshold => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigurationsCopyWith<Configurations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationsCopyWith<$Res> {
  factory $ConfigurationsCopyWith(
          Configurations value, $Res Function(Configurations) then) =
      _$ConfigurationsCopyWithImpl<$Res, Configurations>;
  @useResult
  $Res call(
      {String baseUrl,
      String? deviceId,
      String? osVersion,
      String? environment,
      bool? isRTL,
      String? countryCode,
      String? languageCode,
      String? currency,
      String? appVersion,
      String? timestamp,
      String? deviceType,
      String? refreshToken,
      String? token,
      double? transactionFee,
      double? verifiedTopUpThreshold,
      double? nonVerifiedTopUpThreshold,
      double? monthlyMaxTopUpThreshold});
}

/// @nodoc
class _$ConfigurationsCopyWithImpl<$Res, $Val extends Configurations>
    implements $ConfigurationsCopyWith<$Res> {
  _$ConfigurationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? deviceId = freezed,
    Object? osVersion = freezed,
    Object? environment = freezed,
    Object? isRTL = freezed,
    Object? countryCode = freezed,
    Object? languageCode = freezed,
    Object? currency = freezed,
    Object? appVersion = freezed,
    Object? timestamp = freezed,
    Object? deviceType = freezed,
    Object? refreshToken = freezed,
    Object? token = freezed,
    Object? transactionFee = freezed,
    Object? verifiedTopUpThreshold = freezed,
    Object? nonVerifiedTopUpThreshold = freezed,
    Object? monthlyMaxTopUpThreshold = freezed,
  }) {
    return _then(_value.copyWith(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: freezed == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      environment: freezed == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as String?,
      isRTL: freezed == isRTL
          ? _value.isRTL
          : isRTL // ignore: cast_nullable_to_non_nullable
              as bool?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionFee: freezed == transactionFee
          ? _value.transactionFee
          : transactionFee // ignore: cast_nullable_to_non_nullable
              as double?,
      verifiedTopUpThreshold: freezed == verifiedTopUpThreshold
          ? _value.verifiedTopUpThreshold
          : verifiedTopUpThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      nonVerifiedTopUpThreshold: freezed == nonVerifiedTopUpThreshold
          ? _value.nonVerifiedTopUpThreshold
          : nonVerifiedTopUpThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      monthlyMaxTopUpThreshold: freezed == monthlyMaxTopUpThreshold
          ? _value.monthlyMaxTopUpThreshold
          : monthlyMaxTopUpThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigurationsImplCopyWith<$Res>
    implements $ConfigurationsCopyWith<$Res> {
  factory _$$ConfigurationsImplCopyWith(_$ConfigurationsImpl value,
          $Res Function(_$ConfigurationsImpl) then) =
      __$$ConfigurationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String baseUrl,
      String? deviceId,
      String? osVersion,
      String? environment,
      bool? isRTL,
      String? countryCode,
      String? languageCode,
      String? currency,
      String? appVersion,
      String? timestamp,
      String? deviceType,
      String? refreshToken,
      String? token,
      double? transactionFee,
      double? verifiedTopUpThreshold,
      double? nonVerifiedTopUpThreshold,
      double? monthlyMaxTopUpThreshold});
}

/// @nodoc
class __$$ConfigurationsImplCopyWithImpl<$Res>
    extends _$ConfigurationsCopyWithImpl<$Res, _$ConfigurationsImpl>
    implements _$$ConfigurationsImplCopyWith<$Res> {
  __$$ConfigurationsImplCopyWithImpl(
      _$ConfigurationsImpl _value, $Res Function(_$ConfigurationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? deviceId = freezed,
    Object? osVersion = freezed,
    Object? environment = freezed,
    Object? isRTL = freezed,
    Object? countryCode = freezed,
    Object? languageCode = freezed,
    Object? currency = freezed,
    Object? appVersion = freezed,
    Object? timestamp = freezed,
    Object? deviceType = freezed,
    Object? refreshToken = freezed,
    Object? token = freezed,
    Object? transactionFee = freezed,
    Object? verifiedTopUpThreshold = freezed,
    Object? nonVerifiedTopUpThreshold = freezed,
    Object? monthlyMaxTopUpThreshold = freezed,
  }) {
    return _then(_$ConfigurationsImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: freezed == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      environment: freezed == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as String?,
      isRTL: freezed == isRTL
          ? _value.isRTL
          : isRTL // ignore: cast_nullable_to_non_nullable
              as bool?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionFee: freezed == transactionFee
          ? _value.transactionFee
          : transactionFee // ignore: cast_nullable_to_non_nullable
              as double?,
      verifiedTopUpThreshold: freezed == verifiedTopUpThreshold
          ? _value.verifiedTopUpThreshold
          : verifiedTopUpThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      nonVerifiedTopUpThreshold: freezed == nonVerifiedTopUpThreshold
          ? _value.nonVerifiedTopUpThreshold
          : nonVerifiedTopUpThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      monthlyMaxTopUpThreshold: freezed == monthlyMaxTopUpThreshold
          ? _value.monthlyMaxTopUpThreshold
          : monthlyMaxTopUpThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigurationsImpl implements _Configurations {
  const _$ConfigurationsImpl(
      {required this.baseUrl,
      this.deviceId,
      this.osVersion,
      this.environment,
      this.isRTL,
      this.countryCode,
      this.languageCode,
      this.currency,
      this.appVersion,
      this.timestamp,
      this.deviceType,
      this.refreshToken,
      this.token,
      this.transactionFee,
      this.verifiedTopUpThreshold,
      this.nonVerifiedTopUpThreshold,
      this.monthlyMaxTopUpThreshold});

  factory _$ConfigurationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigurationsImplFromJson(json);

  @override
  final String baseUrl;

  /// Device
  @override
  final String? deviceId;
  @override
  final String? osVersion;
  @override
  final String? environment;
  @override
  final bool? isRTL;

  /// Location
  @override
  final String? countryCode;
  @override
  final String? languageCode;

  /// App
  @override
  final String? currency;
  @override
  final String? appVersion;
  @override
  final String? timestamp;
  @override
  final String? deviceType;

  /// Authentication
  @override
  final String? refreshToken;
  @override
  final String? token;
// other configurations
  @override
  final double? transactionFee;
// how mush is the transaction fee
  @override
  final double? verifiedTopUpThreshold;
// AED 1000
  @override
  final double? nonVerifiedTopUpThreshold;
// AED 500
  @override
  final double? monthlyMaxTopUpThreshold;

  @override
  String toString() {
    return 'Configurations(baseUrl: $baseUrl, deviceId: $deviceId, osVersion: $osVersion, environment: $environment, isRTL: $isRTL, countryCode: $countryCode, languageCode: $languageCode, currency: $currency, appVersion: $appVersion, timestamp: $timestamp, deviceType: $deviceType, refreshToken: $refreshToken, token: $token, transactionFee: $transactionFee, verifiedTopUpThreshold: $verifiedTopUpThreshold, nonVerifiedTopUpThreshold: $nonVerifiedTopUpThreshold, monthlyMaxTopUpThreshold: $monthlyMaxTopUpThreshold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigurationsImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.environment, environment) ||
                other.environment == environment) &&
            (identical(other.isRTL, isRTL) || other.isRTL == isRTL) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.transactionFee, transactionFee) ||
                other.transactionFee == transactionFee) &&
            (identical(other.verifiedTopUpThreshold, verifiedTopUpThreshold) ||
                other.verifiedTopUpThreshold == verifiedTopUpThreshold) &&
            (identical(other.nonVerifiedTopUpThreshold,
                    nonVerifiedTopUpThreshold) ||
                other.nonVerifiedTopUpThreshold == nonVerifiedTopUpThreshold) &&
            (identical(
                    other.monthlyMaxTopUpThreshold, monthlyMaxTopUpThreshold) ||
                other.monthlyMaxTopUpThreshold == monthlyMaxTopUpThreshold));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      baseUrl,
      deviceId,
      osVersion,
      environment,
      isRTL,
      countryCode,
      languageCode,
      currency,
      appVersion,
      timestamp,
      deviceType,
      refreshToken,
      token,
      transactionFee,
      verifiedTopUpThreshold,
      nonVerifiedTopUpThreshold,
      monthlyMaxTopUpThreshold);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigurationsImplCopyWith<_$ConfigurationsImpl> get copyWith =>
      __$$ConfigurationsImplCopyWithImpl<_$ConfigurationsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigurationsImplToJson(
      this,
    );
  }
}

abstract class _Configurations implements Configurations {
  const factory _Configurations(
      {required final String baseUrl,
      final String? deviceId,
      final String? osVersion,
      final String? environment,
      final bool? isRTL,
      final String? countryCode,
      final String? languageCode,
      final String? currency,
      final String? appVersion,
      final String? timestamp,
      final String? deviceType,
      final String? refreshToken,
      final String? token,
      final double? transactionFee,
      final double? verifiedTopUpThreshold,
      final double? nonVerifiedTopUpThreshold,
      final double? monthlyMaxTopUpThreshold}) = _$ConfigurationsImpl;

  factory _Configurations.fromJson(Map<String, dynamic> json) =
      _$ConfigurationsImpl.fromJson;

  @override
  String get baseUrl;
  @override

  /// Device
  String? get deviceId;
  @override
  String? get osVersion;
  @override
  String? get environment;
  @override
  bool? get isRTL;
  @override

  /// Location
  String? get countryCode;
  @override
  String? get languageCode;
  @override

  /// App
  String? get currency;
  @override
  String? get appVersion;
  @override
  String? get timestamp;
  @override
  String? get deviceType;
  @override

  /// Authentication
  String? get refreshToken;
  @override
  String? get token;
  @override // other configurations
  double? get transactionFee;
  @override // how mush is the transaction fee
  double? get verifiedTopUpThreshold;
  @override // AED 1000
  double? get nonVerifiedTopUpThreshold;
  @override // AED 500
  double? get monthlyMaxTopUpThreshold;
  @override
  @JsonKey(ignore: true)
  _$$ConfigurationsImplCopyWith<_$ConfigurationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
