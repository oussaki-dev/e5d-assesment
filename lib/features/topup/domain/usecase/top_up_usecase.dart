import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/features/login/presentation/viewmodel/login_viewmodel.dart';
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
  return TopUpBeneficiaryUseCase(repo, ref);
});

class TopUpBeneficiaryUseCase
    extends UseCase<TopUpTransaction, AbstractTopUpRequest, TopUpUiStates> {
  final AbstractTopUpRepository repository;
  final Ref ref;
  final int transactionFee = 1; // AED 1

  // injecting the repo for better testing
  TopUpBeneficiaryUseCase(this.repository, this.ref);

  @override
  Future<Either<TopUpUiStates, TopUpTransaction>> call(
      AbstractTopUpRequest request) async {
    //get the configuration
    final Configurations? config = ref.watch(configProvider);

    //get the current loggedInUser
    final loginState = ref.read(loginViewModelProvider);

    // make sure user is logged in
    if (loginState.loggedInUser == null) {
      return const Left(TopUpUiStates.userNotLoggedIn);
    }

    // total to be debited amount + fee
    final total = request.amount + (config?.transactionFee ?? 0);

    // - if the total is less or equal zero , very edge case scenario
    // or
    // - if total is more than the balance available
    // in this case the user have no enough balance.
    if (total <= 0.0 || total > (loginState.loggedInUser?.balance ?? 0.0)) {
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
