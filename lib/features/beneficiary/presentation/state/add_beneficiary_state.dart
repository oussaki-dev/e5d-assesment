import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';

enum AddBeneficiaryErrors {
  none,
  loading,
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
  AddBeneficiaryState({this.uiState});
  AddBeneficiaryErrors? uiState;
}
