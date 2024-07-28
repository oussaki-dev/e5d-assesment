
import 'package:freezed_annotation/freezed_annotation.dart';


part 'configurations_model.freezed.dart';
part 'configurations_model.g.dart';
///
///A model for all possible configurable variables 
///that can be used for http headers
///or configuring some api end points
///
@freezed
class Configurations with _$Configurations {

  const factory Configurations({
  required String baseUrl,

  /// Users
  String? userId,
  bool? isLoggedIn,

  /// Device
  String? deviceId,
  String? osVersion,
  String? environment,
  bool? isRTL,

  /// Location
  String? countryCode,
  String? languageCode,

  /// App
  String? currency,
  String? appVersion,
  String? timestamp,
  String? deviceType,

  /// Authentication
  String? refreshToken,
  String? token,

 }) = _Configurations;
 
  factory Configurations.fromJson(Map<String, Object?> json) =>
      _$ConfigurationsFromJson(json);

}