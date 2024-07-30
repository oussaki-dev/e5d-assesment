import 'package:e5d_assesment/core/network/abstract_api_client.dart';
import 'package:e5d_assesment/core/network/api_client_provider.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/features/beneficiary/data/data_sources/abstract_beneficiary_source.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/abstract_beneficiary.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/list_beneficiaries_response.dart';
import 'package:e5d_assesment/features/topup/data/data_source/abstract_topup_source.dart';
import 'package:e5d_assesment/features/topup/domain/model/abstract_topup_request.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

// provider
final topupApiImplProvider = Provider<AbstractTopUpSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return TopUpApiImpl(apiClient: apiClient!);
});

/// Api implementation
class TopUpApiImpl extends AbstractTopUpSource {
  AbstractApiClient apiClient;

  TopUpApiImpl({required this.apiClient});

  @override
  Future<TopUpTransaction> topUp(AbstractTopUpRequest input) async {
   try {
      Response<dynamic> response = await apiClient.post(
        '${apiClient.baseUrl}/topup',
        data: input.toJson(),
      );
      if (response.data is Map) {
        try {
          // it should be a map because json is a map of values
          final transaction = TopUpTransaction.fromJson(response.data);
          return Future.value(transaction);
        } catch (e) {
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
  Future<List<TopUpTransaction>> getTransactions() {
  // try {
  //     Response<dynamic> response = await apiClient.get(
  //       '${apiClient.baseUrl}/topup',
  //     );

  //     if (response.data is Map) {
  //       try {
  //         // it should be a map because json is a map of values
  //         return Future.value(
  //           BeneficiariesResponse.fromJson(response.data).beneficiaries,
  //         );
  //       } on Exception catch (_) {
  //         throw ResponseParsingException();
  //       }
  //     } else {
  //       throw ResponseParsingException();
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
      throw UnimplementedError();
  }

 
}
