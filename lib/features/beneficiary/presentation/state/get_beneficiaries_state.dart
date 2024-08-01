import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';

enum GetBeneficiariesUiStates {
  none,
  idle,
  loading,
  networkIssue,
  genericError,
  // down domain specific errors
  emptyList,
  success;
}


class GetBeneficiariesState {
  GetBeneficiariesState({ this.uiState});
  GetBeneficiariesUiStates? uiState;
}

