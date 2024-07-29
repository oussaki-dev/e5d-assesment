import 'package:dio/dio.dart';
import 'package:e5d_assesment/core/network/abstract_api_client.dart';
import 'package:e5d_assesment/core/network/api_client_provider.dart';
import 'package:e5d_assesment/features/login/data/data_sources/abstract_login_source.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/login/presentation/errors/login_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider
final loginApiImplProvider = Provider<AbstractLoginSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return LoginApiImpl(apiClient: apiClient!);
});

/// Api implementation
class LoginApiImpl extends AbstractLoginSource {
  AbstractApiClient apiClient;

  LoginApiImpl({required this.apiClient});

  @override
  Future<UserModel> login(ILoginModel params) async {
    LoginModel model = (params as LoginModel);
    try {
      Response<dynamic> response = await apiClient.post(
        '${apiClient.baseUrl}/login',
        data: Map.from(
          {'username': model.userName, 'password': model.password},
        ),
      );
      try {
        if (response.data is Map) {
          // it should be a map because json is a map of values
          return Future.value(UserModel.fromJson(response.data));
        } else {
          throw UserNotFoundError();
        }
      } on Exception catch (e) {
        throw LoginResponseError(e.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
