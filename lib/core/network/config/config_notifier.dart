import 'dart:io';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final NotifierProvider<ConfigNotifier, Configurations?> configProvider =
    NotifierProvider<ConfigNotifier, Configurations?>(
  ConfigNotifier.new,
);

class ConfigNotifier extends Notifier<Configurations?> {
  @override
  Configurations? build() {
    return null;
  }

  void setConfig({required Configurations config}) {
    state = config;
  }

  void updateWith({required Configurations config}) {
    if (state == null) {
      setConfig(config: config);
    } else {
      state = state!.copyWith(
        baseUrl: config.baseUrl,
        userId: config.userId,
        isLoggedIn: config.isLoggedIn,
        deviceId: config.deviceId,
        osVersion: config.osVersion,
        environment: config.environment,
        isRTL: config.isRTL,
        countryCode: config.countryCode,
        languageCode: config.languageCode,
        currency: config.currency,
        appVersion: config.appVersion,
        timestamp: config.timestamp,
        deviceType: config.deviceType,
        token: config.token,
        transactionFee: config.transactionFee
      );
    }
  }
}

Configurations getMockAppConfigurations({bool getPROD = false}) {
  if (!kDebugMode) {
    throw Exception("Mock data can only be used in debug mode.");
  }

  if (getPROD) {
    const String prodAuthToken =
        "Bearer SPtb8wrt2RHEWD-F1e5WUA_kgvVjd_KC3SFcgmwY7R0ic11xQLotHg6jArnbeV22QNy9qOqKnHrDluDH3EV9l0ATbZY4OJXye6dy5j7A8W9vGVFpDwYRhMfj3p-MH4pWjVbEMIXJlksAR7bFzuXFXkkWcW9gLhkh60m_i0Eg0w8NxM5YcGjP9gC49LOoAM4aXzHtGsBTkp8tMGiVNRfEEVr8pZT8fk-0upFYWmcX_rH-51_HIVE4OVXAO5uz-xM1F1MC-DLMdBxplnQth4yo6gyhnX1uxbPODMtatP44pzo4d6tIIokrI0sbNAxQwCwcv219ApE8KYPDp464MgbcMA";

    return Configurations(
      baseUrl: 'https://api-prod.domain.com',
      userId: "test@gmail.com",
      isLoggedIn: true,
      deviceId: "EBDCD69D-7719-4AC0-A8F0-13D512C49AC2",
      osVersion: Platform.operatingSystemVersion,
      environment: "PROD",
      isRTL: false,
      countryCode: "uae",
      languageCode: "en",
      currency: "AED",
      appVersion: "130",
      timestamp: "1716895645",
      deviceType: "Android",
      token: prodAuthToken,
    );
  }

  const String uatAuthToken =
      "Bearer s3ktNE5KVfKkvok0kQtLbvnqUkbuemHyz_mG7cO4jE5IzrWCQt4PxWTaVvHfBbElA2JCOpVhDLVGqOZpfndzWikYG2CHEFIodE9qO3w3OPKvKeaStNl8yMD-C30Bx7AK07R0bsErmTImPJZxOSjF7jgHm-VAdiwHWxNbBd1APtHDE-nMR88wFw2_-kZ9Faiy_RW9TAL-Jviq3L9o-fFUbqgxVYZTH_EVlDM2LbTmOgBHO3xx_LIScQu-b6pZqj4F9V4tM0cIvNP3rc-mh8K6I3FSD6gYqAAWTEeaPmL0whlGV195I6NXeawx4RwKoZtAVXSXmd2pCONnxzdzLFBiJQ";

  return Configurations(
    baseUrl: 'https://api-test.domain.com',
    userId: "joewho_uat2@yopmail.com",
    isLoggedIn: true,
    deviceId: "EBDCD69D-7719-4AC0-A8F0-13D512C49AC2",
    osVersion: Platform.operatingSystemVersion,
    environment: "UAT2",
    isRTL: false,
    countryCode: "uae",
    languageCode: "en",
    currency: "AED",
    appVersion: "110124",
    timestamp: "1716895645",
    deviceType: "IOS",
    token: uatAuthToken,
  );
}
