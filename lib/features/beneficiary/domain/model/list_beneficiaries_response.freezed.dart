// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_beneficiaries_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BeneficiariesResponse _$BeneficiariesResponseFromJson(
    Map<String, dynamic> json) {
  return _BeneficiariesResponse.fromJson(json);
}

/// @nodoc
mixin _$BeneficiariesResponse {
  @JsonKey(name: 'beneficiaries')
  List<Beneficiary> get beneficiaries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeneficiariesResponseCopyWith<BeneficiariesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeneficiariesResponseCopyWith<$Res> {
  factory $BeneficiariesResponseCopyWith(BeneficiariesResponse value,
          $Res Function(BeneficiariesResponse) then) =
      _$BeneficiariesResponseCopyWithImpl<$Res, BeneficiariesResponse>;
  @useResult
  $Res call({@JsonKey(name: 'beneficiaries') List<Beneficiary> beneficiaries});
}

/// @nodoc
class _$BeneficiariesResponseCopyWithImpl<$Res,
        $Val extends BeneficiariesResponse>
    implements $BeneficiariesResponseCopyWith<$Res> {
  _$BeneficiariesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaries = null,
  }) {
    return _then(_value.copyWith(
      beneficiaries: null == beneficiaries
          ? _value.beneficiaries
          : beneficiaries // ignore: cast_nullable_to_non_nullable
              as List<Beneficiary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeneficiariesResponseImplCopyWith<$Res>
    implements $BeneficiariesResponseCopyWith<$Res> {
  factory _$$BeneficiariesResponseImplCopyWith(
          _$BeneficiariesResponseImpl value,
          $Res Function(_$BeneficiariesResponseImpl) then) =
      __$$BeneficiariesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'beneficiaries') List<Beneficiary> beneficiaries});
}

/// @nodoc
class __$$BeneficiariesResponseImplCopyWithImpl<$Res>
    extends _$BeneficiariesResponseCopyWithImpl<$Res,
        _$BeneficiariesResponseImpl>
    implements _$$BeneficiariesResponseImplCopyWith<$Res> {
  __$$BeneficiariesResponseImplCopyWithImpl(_$BeneficiariesResponseImpl _value,
      $Res Function(_$BeneficiariesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaries = null,
  }) {
    return _then(_$BeneficiariesResponseImpl(
      beneficiaries: null == beneficiaries
          ? _value._beneficiaries
          : beneficiaries // ignore: cast_nullable_to_non_nullable
              as List<Beneficiary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeneficiariesResponseImpl implements _BeneficiariesResponse {
  const _$BeneficiariesResponseImpl(
      {@JsonKey(name: 'beneficiaries')
      required final List<Beneficiary> beneficiaries})
      : _beneficiaries = beneficiaries;

  factory _$BeneficiariesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeneficiariesResponseImplFromJson(json);

  final List<Beneficiary> _beneficiaries;
  @override
  @JsonKey(name: 'beneficiaries')
  List<Beneficiary> get beneficiaries {
    if (_beneficiaries is EqualUnmodifiableListView) return _beneficiaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beneficiaries);
  }

  @override
  String toString() {
    return 'BeneficiariesResponse(beneficiaries: $beneficiaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeneficiariesResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._beneficiaries, _beneficiaries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_beneficiaries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeneficiariesResponseImplCopyWith<_$BeneficiariesResponseImpl>
      get copyWith => __$$BeneficiariesResponseImplCopyWithImpl<
          _$BeneficiariesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeneficiariesResponseImplToJson(
      this,
    );
  }
}

abstract class _BeneficiariesResponse implements BeneficiariesResponse {
  const factory _BeneficiariesResponse(
          {@JsonKey(name: 'beneficiaries')
          required final List<Beneficiary> beneficiaries}) =
      _$BeneficiariesResponseImpl;

  factory _BeneficiariesResponse.fromJson(Map<String, dynamic> json) =
      _$BeneficiariesResponseImpl.fromJson;

  @override
  @JsonKey(name: 'beneficiaries')
  List<Beneficiary> get beneficiaries;
  @override
  @JsonKey(ignore: true)
  _$$BeneficiariesResponseImplCopyWith<_$BeneficiariesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
