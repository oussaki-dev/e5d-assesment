import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_ui_states.dart';

class TopUpState {
  final double _selectedAmount;
  final Beneficiary? _beneficiary;
  final TopUpUiStates? _uiState;

  double get selectedAmount => _selectedAmount;
  Beneficiary? get beneficiary => _beneficiary;
  TopUpUiStates? get uiState => _uiState;
  TopUpTransaction? get transaction => _transaction;

  final TopUpTransaction? _transaction;

  const TopUpState({
    required double selectedAmount,
    Beneficiary? beneficiary,
    TopUpUiStates? uiState,
    TopUpTransaction? transaction,
  })  : _selectedAmount = selectedAmount,
        _beneficiary = beneficiary,
        _uiState = uiState,
        _transaction = transaction;

  bool isSelectedAmount() {
    return _selectedAmount != 0;
  }

  TopUpState updateSelectedTopUp(double value) {
    return TopUpState(
      selectedAmount: value,
      beneficiary: _beneficiary,
      uiState: _uiState,
    );
  }

  TopUpState updateBeneficiary(Beneficiary beneficiary) {
    return TopUpState(
      selectedAmount: _selectedAmount,
      beneficiary: beneficiary,
      uiState: _uiState,
    );
  }

  TopUpState updateUiState(TopUpUiStates uiState) {
    return TopUpState(
      selectedAmount: _selectedAmount,
      beneficiary: _beneficiary,
      transaction: _transaction,
      uiState: uiState,
    );
  }

  TopUpState successfulTransaction(
    TopUpTransaction transaction,
    TopUpUiStates uiState,
  ) {
    return TopUpState(
      selectedAmount: _selectedAmount,
      beneficiary: _beneficiary,
      uiState: uiState,
      transaction: transaction,
    );
  }

  TopUpState reset() {
    return const TopUpState(
      selectedAmount: 0,
      beneficiary: null,
      uiState: TopUpUiStates.none,
      transaction: null,
    );
  }
}
