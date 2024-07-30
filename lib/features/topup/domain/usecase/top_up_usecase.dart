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
import 'package:e5d_assesment/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

final topUpBeneficiaryUseCaseProvider =
    Provider<TopUpBeneficiaryUseCase>((ref) {
  final repo = ref.watch(topupRepositoryProvider);
  final config = ref.watch(configProvider);
  final session = ref.watch(sessionProvider);
  return TopUpBeneficiaryUseCase(repo, config, session);
});

class TopUpBeneficiaryUseCase
    extends UseCase<TopUpTransaction, AbstractTopUpRequest, TopUpUiStates> {
  final AbstractTopUpRepository repository;
  final Configurations? config;
  final SessionModel? session;
  final double verifiedThreshold = 1000; // AED 1000
  final double nonVerifiedThreshold = 500; // AED 500

  // injecting the repo for better testing
  TopUpBeneficiaryUseCase(this.repository, this.config, this.session);

  double _totalTopUpForBeneficiaryThisMonth(
      String beneficiaryId, List<TopUpTransaction>? transactions) {
    double monthAmount = 0;
    transactions?.where((t) => t.beneficiary.id == beneficiaryId).forEach((t) {
      monthAmount += t.amount;
    });
    return monthAmount;
  }

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
    final totalToPay = request.amount + (config?.transactionFee ?? 0);

    // - if the total is less or equal zero , very edge case scenario
    // or
    // - if total is more than the balance available
    // in this case the user have no enough balance.
    if (totalToPay <= 0.0 || totalToPay > (session?.user?.balance ?? 0.0)) {
      return const Left(TopUpUiStates.noEnoughBalance);
    }

    double monthlyTotalTopUpAmount = _totalTopUpForBeneficiaryThisMonth(
      request.beneficiaryId,
      session?.user?.transactions,
    );
    loggerNoStack.d('monthlyTotalTopUpAmount = $monthlyTotalTopUpAmount');
    // when user not verified
    if (session?.user?.isVerified == false) {
      // check that for the current beneficiary toping up won't
      // contradict the max limit for each which is 500 AED

      if (monthlyTotalTopUpAmount >= nonVerifiedThreshold) {
        return const Left(
            TopUpUiStates.alreadyReachedMonthlyThresholdNonVerifiedUser);
      }
      if (monthlyTotalTopUpAmount + totalToPay > nonVerifiedThreshold) {
        return const Left(TopUpUiStates.reachedMonthlyThresholdNonVerifiedUser);
      }
    } else {
      if (monthlyTotalTopUpAmount >= verifiedThreshold) {
        return const Left(
            TopUpUiStates.alreadyReachedMonthlyThresholdNonVerifiedUser);
      }
      if (monthlyTotalTopUpAmount + totalToPay > verifiedThreshold) {
        return const Left(TopUpUiStates.reachedMonthlyThresholdNonVerifiedUser);
      }
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
