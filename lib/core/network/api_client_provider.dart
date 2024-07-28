import 'package:e5d_assesment/core/network/api_client.dart';
import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



Map<String, dynamic> _getCommonHeaders(Configurations config) {
  Map<String, dynamic> headers = {
    "appId": config.deviceType,
    "lang": config.languageCode,
    "timeStamp": config.timestamp,
    "userId": config.userId,
    "appVersion": config.appVersion,
    "env": config.environment,
    "token": config.token,
    "langCode": config.languageCode,
    "deviceId": config.deviceId,
    "currency": config.currency,
  };

  return headers;
}

final Provider<ApiClient?> apiClientProvider = Provider<ApiClient?>(
  (ref) {
    final Configurations? config = ref.watch(configProvider);

    if (config == null) {
      return null;
    }

    ApiClient client = ApiClient(
      baseUrl: config.baseUrl,
      headers: _getCommonHeaders(config),
    );

    return client;
  },
);