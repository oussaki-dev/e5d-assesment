import 'package:e5d_assesment/features/topup/domain/model/top_up_request.dart';
import 'package:e5d_assesment/features/topup/domain/usecase/top_up_usecase.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_state.dart';
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
    return const TopUpState(beneficiary: null);
  }

  void updateTopUp(double value) {
    state = state.updateSelectedTopUp(value);
    loggerNoStack.d("new state ${state.selectedAmount} ");
  }

  void topUp() async {
    // call the usecase to topup
    if (state.beneficiary == null) {
      // send error here 

    }

    if (state.selectedAmount == 0) {
      // send error here

    }

    await topUpUseCase?.call(TopUpRequest(
      beneficiaryId: state.beneficiary!.id,
      amount: state.selectedAmount,
    ));
  }
}
