import 'package:e5d_assesment/core/network/abstract_api_client.dart';
import 'package:e5d_assesment/core/network/api_client_provider.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/features/beneficiary/data/data_sources/abstract_beneficiary_source.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/abstract_beneficiary.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/list_beneficiaries_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

// provider
final beneficiaryApiImplProvider = Provider<AbstractBeneficiarySource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return BeneficiaryApiImpl(apiClient: apiClient!);
});

/// Api implementation
class BeneficiaryApiImpl extends AbstractBeneficiarySource {
  AbstractApiClient apiClient;

  BeneficiaryApiImpl({required this.apiClient});

  @override
  Future<Beneficiary> addBeneficiary(IBeneficiaryInput input) async {
    try {
      Response<dynamic> response = await apiClient.post(
        '${apiClient.baseUrl}/beneficiary',
        data: input.toJson(),
      );

      if (response.data is Map) {
        try {
          // it should be a map because json is a map of values
          return Future.value(Beneficiary.fromJson(response.data));
        } on Exception catch (e) {
          throw ResponseParsingException();
        }
      } else {
        throw ResponseParsingException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Beneficiary>> getBeneficiaries() async {
    try {
      Response<dynamic> response = await apiClient.get(
        '${apiClient.baseUrl}/beneficiary',
      );

      if (response.data is Map) {
        try {
          // it should be a map because json is a map of values
          return Future.value(
            BeneficiariesResponse.fromJson(response.data).beneficiaries,
          );
        } on Exception catch (_) {
          throw ResponseParsingException();
        }
      } else {
        throw ResponseParsingException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Beneficiary> removeBeneficiary(IBeneficiaryInput beneficiary) {
    // TODO: implement removeBeneficiary
    throw UnimplementedError();
  }
}
