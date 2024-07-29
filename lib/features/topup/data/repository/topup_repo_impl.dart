import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/core/network/network_exceptions.dart';
import 'package:e5d_assesment/features/topup/data/data_source/abstract_topup_source.dart';
import 'package:e5d_assesment/features/topup/data/data_source/remote/topup_api_impl.dart';
import 'package:e5d_assesment/features/topup/domain/model/abstract_topup_request.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';
import 'package:e5d_assesment/features/topup/domain/repository/abstract_topup_repository.dart';
import 'package:e5d_assesment/features/topup/presentation/state/get_transactions_ui_states.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_ui_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topupRepositoryProvider = Provider<AbstractTopUpRepository>((ref) {
  final api = ref.watch(topupApiImplProvider);
  return TopUpRepoImpl(api);
});

class TopUpRepoImpl implements AbstractTopUpRepository {
  final AbstractTopUpSource _api;

  TopUpRepoImpl(AbstractTopUpSource api) : _api = api;

  @override
  Future<Either<TopUpUiStates, TopUpTransaction>> topUp(
      AbstractTopUpRequest request) async {
    try {
      TopUpTransaction transaction = await _api.topUp(request);
      return Right(transaction);
    } on E5DError catch (e) {
      if (e is NetworkException) {
        return const Left(TopUpUiStates.networkIssue);
      }
      return const Left(TopUpUiStates.genericError);
    }
  }

  @override
  Future<Either<GetTransactionsUiStates, List<TopUpTransaction>>>
      getTransactions() {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }
}
