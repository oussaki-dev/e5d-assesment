import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/features/login/domain/model/session_model.dart';
import 'package:e5d_assesment/features/login/domain/model/session_notifier.dart';
import 'package:e5d_assesment/features/topup/data/repository/topup_repo_impl.dart';
import 'package:e5d_assesment/features/topup/domain/model/abstract_topup_request.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';
import 'package:e5d_assesment/features/topup/domain/repository/abstract_topup_repository.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_ui_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

final topUpBeneficiaryUseCaseProvider =
    Provider<TopUpBeneficiaryUseCase>((ref) {
  final repo = ref.watch(topupRepositoryProvider);
  final config = ref.watch(configProvider);
  final session = ref.watch(sessionProvider);
  return TopUpBeneficiaryUseCase(repo, ref, config, session);
});

class TopUpBeneficiaryUseCase
    extends UseCase<TopUpTransaction, AbstractTopUpRequest, TopUpUiStates> {
  final AbstractTopUpRepository repository;
  final Configurations? config;
  final SessionModel? session;
  final Ref ref;
  final int transactionFee = 1; // AED 1

  // injecting the repo for better testing
  TopUpBeneficiaryUseCase(this.repository, this.ref, this.config, this.session);

  @override
  Future<Either<TopUpUiStates, TopUpTransaction>> call(
      AbstractTopUpRequest request) async {
    // session shouldn't be expired
    if (session?.isLoggedIn == false) {
      return const Left(
        TopUpUiStates.sessionExpired,
      );
    }

    // total to be debited amount + fee
    final total = request.amount + (config?.transactionFee ?? 0);

    // - if the total is less or equal zero , very edge case scenario
    // or
    // - if total is more than the balance available
    // in this case the user have no enough balance.
    if (total <= 0.0 || total > (session?.user?.balance ?? 0.0)) {
      return const Left(TopUpUiStates.noEnoughBalance);
    }

    // call the repository
    final result = await repository.topUp(request);

    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
