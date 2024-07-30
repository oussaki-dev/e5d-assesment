import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/login/domain/model/session_model.dart';
import 'package:e5d_assesment/features/login/domain/model/session_notifier.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_request.dart';
import 'package:e5d_assesment/features/topup/domain/usecase/top_up_usecase.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_state.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_ui_states.dart';
import 'package:e5d_assesment/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topup_viewmodel.g.dart';

@riverpod
class TopUpViewModel extends _$TopUpViewModel {
  TopUpBeneficiaryUseCase? topUpUseCase;

  @override
  TopUpState build() {
    topUpUseCase = ref.read(topUpBeneficiaryUseCaseProvider);
    return const TopUpState(
      selectedAmount: 0,
    );
  }

  void updateTopUp(double value) {
    state = state.updateSelectedTopUp(value);
    loggerNoStack.d("new state ${state.selectedAmount} ");
  }

  void updateBeneficiary(Beneficiary beneficiary) {
    if (beneficiary.id.isNotEmpty) {
      state = state.updateBeneficiary(beneficiary);
    }
  }

  void topUp() async {
    final request = TopUpRequest(
      beneficiaryId: state.beneficiary!.id,
      amount: state.selectedAmount,
    );

    topUpUseCase?.areInputsValid(request).fold((error) {
      state = state.updateUiState(error);
    }, (totalToPay) async {
      // before calling the api
      // we have to debit the amount
      final session = ref.watch(sessionProvider);

      final oldBalance = session?.user?.balance;
      final newBalance = oldBalance! - totalToPay;

      // save temporary balance and old balance for transaction revert in case of errors
      loggerNoStack.d("old balance $oldBalance, newBalance =$newBalance  ");

      // update the session balance
      final newSession = session?.copyWith(
        user: session.user?.copyWith(balance: newBalance),
        oldBalance: oldBalance,
      );
      final sessionNotifier = ref.watch(sessionProvider.notifier);
      sessionNotifier.updateWith(session: newSession!);

      //Call the api
      state = state.updateUiState(
        TopUpUiStates.loading,
      );
      final result = await topUpUseCase?.call(request);
     

      result?.fold((error) {
        // revert the state to the old balance
        if (oldBalance > 0) {
          final sessionNotifier2 = ref.read(sessionProvider.notifier);
          final revertSession = session?.copyWith(
            user: session.user?.copyWith(balance: oldBalance),
            oldBalance: 0,
          );
          sessionNotifier2.updateWith(session: revertSession!);
        }

        state = state.updateUiState(error);
      }, (transaction) {
        state = state.successfulTransaction(
          transaction,
          TopUpUiStates.successfulTransaction,
        );
      });
    });
  }
}
