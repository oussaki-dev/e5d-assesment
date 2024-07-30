import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
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

    final result = await topUpUseCase?.call(TopUpRequest(
      beneficiaryId: state.beneficiary!.id,
      amount: state.selectedAmount,
    ));

    result?.fold((error) {
      state = state.updateUiState(error);
    }, (transaction) {
      state = state.successfulTransaction(
        transaction,
        TopUpUiStates.successfulTransaction,
      );
    });
  }
}
