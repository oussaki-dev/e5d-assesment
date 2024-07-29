import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/login/data/repository/login_repo_impl.dart';
import 'package:e5d_assesment/features/login/data/repository/login_with_mobile_repo_impl.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/abstract_login_repo.dart';
import 'package:e5d_assesment/features/login/domain/usecase/login_default_usecase.dart';
import 'package:e5d_assesment/features/topup/domain/model/abstract_topup_request.dart';
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
    await topUpUseCase?.call();
  }
}
