import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';

enum AddBeneficiaryErrors {
  none,
  networkIssue,
  genericError,
  // down domain specific errors
  nicknameRequired,
  nickNameTooLong,
  mobileNumberRequired,
  invalidMobileNumber,
  alreadyExists,
  reachedTheMax,
  success;
}


class AddBeneficiaryState {
  AddBeneficiaryState({this.loadingState, this.uiState});
  ScreenUiState? loadingState;
  AddBeneficiaryErrors? uiState;
}


