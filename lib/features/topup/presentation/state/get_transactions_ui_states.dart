import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';

enum GetTransactionsUiStates {
  none,
  networkIssue,
  genericError,
  // down domain specific errors
  noTransactions,
  success;
}

class GetTransactionsState {
  GetTransactionsState({this.loadingState, this.uiState});
  ScreenUiState? loadingState;
  GetTransactionsUiStates? uiState;
}
