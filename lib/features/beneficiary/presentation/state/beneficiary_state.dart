import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_input_mode.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/add_beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/get_beneficiaries_state.dart';

class BeneficiaryState {
  final BeneficiaryInput?
      addFormBeneficiary; // the state for the inputs of the form
  final bool? isGetBeneficiariesCalled;

  // bellow the UI state (loading , success, error ) for each kind of beneficiary ui we have
  final AddBeneficiaryState? addState;

  final ScreenUiState? removeUiState;
  final GetBeneficiariesState? listUiState;

  // used to show the list of beneficiaries fetched
  final List<Beneficiary>? beneficiaries;

  const BeneficiaryState(
      {this.addFormBeneficiary,
      this.beneficiaries,
      this.addState,
      this.removeUiState,
      this.listUiState,
      this.isGetBeneficiariesCalled = false});

  BeneficiaryState copyWithAddBeneficiaryJustUiState(
    AddBeneficiaryState? addState,
  ) {
    return BeneficiaryState(
        addState: addState,
        addFormBeneficiary: addFormBeneficiary,
        beneficiaries: beneficiaries,
        removeUiState: removeUiState,
        listUiState: listUiState,
        isGetBeneficiariesCalled: isGetBeneficiariesCalled);
  }


  BeneficiaryState copyWith(
      {BeneficiaryInput? addFormBeneficiary,
      List<Beneficiary>? beneficiaries,
      AddBeneficiaryState? addState,
      ScreenUiState? removeUiState,
      GetBeneficiariesState? listUiState,
      bool? isGetBeneficiariesCalled}) {
    return BeneficiaryState(
      addState: addState ?? this.addState,
      addFormBeneficiary: addFormBeneficiary ?? this.addFormBeneficiary,
      beneficiaries: beneficiaries ?? this.beneficiaries,
      removeUiState: removeUiState ?? this.removeUiState,
      listUiState: listUiState ?? this.listUiState,
      isGetBeneficiariesCalled:
          isGetBeneficiariesCalled ?? this.isGetBeneficiariesCalled,
    );
  }

  BeneficiaryState copyWithNewBeneficiary(
    Beneficiary beneficiary,
    AddBeneficiaryState? addState,
  ) {
    List<Beneficiary> newList = List.empty(growable: true);

    if (beneficiaries == null) {
      newList.add(beneficiary);
    } else {
      newList
        ..addAll(beneficiaries!)
        ..add(beneficiary);
    }

    return BeneficiaryState(
        addState: addState,
        addFormBeneficiary: addFormBeneficiary,
        beneficiaries: newList,
        removeUiState: removeUiState,
        listUiState: listUiState,
        isGetBeneficiariesCalled: isGetBeneficiariesCalled);
  }

  BeneficiaryState reset() {
    return BeneficiaryState(
        addState: AddBeneficiaryState(uiState: AddBeneficiaryErrors.none),
        addFormBeneficiary: BeneficiaryInput(nickname: '', mobileNumber: ''),
        beneficiaries: beneficiaries,
        removeUiState: null,
        listUiState: null,
        isGetBeneficiariesCalled: isGetBeneficiariesCalled);
  }

}
