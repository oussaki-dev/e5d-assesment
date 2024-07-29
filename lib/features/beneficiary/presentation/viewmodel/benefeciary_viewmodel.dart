import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_input_mode.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:dlibphonenumber/dlibphonenumber.dart';
import 'package:e5d_assesment/features/beneficiary/domain/usecases/add_beneficiary_usecase.dart';
import 'package:e5d_assesment/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'benefeciary_viewmodel.g.dart';

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

enum AddBeneficiaryLoadingState {
  idle,
  loading;
}

class AddBeneficiaryState {
  AddBeneficiaryState({this.loadingState, this.uiState});
  AddBeneficiaryLoadingState? loadingState;
  AddBeneficiaryErrors? uiState;
}

class BeneficiaryState {
  final BeneficiaryInput?
      addFormBeneficiary; // the state for the inputs of the form

  // bellow the UI state (loading , success, error ) for each kind of beneficiary ui we have
  final AddBeneficiaryState? addState;

  final ScreenUiState? removeUiState;
  final ScreenUiState? listUiState;

  // used to show the list of beneficiaries fetched
  final List<Beneficiary>? beneficiaries;

  const BeneficiaryState(
      {this.addFormBeneficiary,
      this.beneficiaries,
      this.addState,
      this.removeUiState,
      this.listUiState});

  BeneficiaryState copyWithAddBeneficiaryJustUiState(
    AddBeneficiaryState? addState,
  ) {
    return BeneficiaryState(
      addState: addState,
      addFormBeneficiary: addFormBeneficiary,
      beneficiaries: beneficiaries,
      removeUiState: removeUiState,
      listUiState: listUiState,
    );
  }
}

@riverpod
class BeneficiaryViewModel extends _$BeneficiaryViewModel {
  AddBeneficiaryUseCase? addBeneficiaryUseCase;

  @override
  BeneficiaryState build() {
    addBeneficiaryUseCase = ref.read(addBeneficiaryUseCaseProvider);
    return BeneficiaryState(
      addFormBeneficiary: BeneficiaryInput(
        nickname: '',
        mobileNumber: '',
      ),
      beneficiaries: List.empty(),
      addState: AddBeneficiaryState(
        loadingState: AddBeneficiaryLoadingState.idle,
        uiState: AddBeneficiaryErrors.none,
      ),
      removeUiState: ScreenUiState.idle,
      listUiState: ScreenUiState.idle,
    );
  }

  // BeneficiaryViewModel({required this.addBeneficiaryUseCase});

  // better to have this from a remote config for better control
  final maxToAdd = 5;

  void addBeneficiary() async {
    // first we validate our inputs
    if (state.beneficiaries?.length == maxToAdd) {
      state = state.copyWithAddBeneficiaryJustUiState(AddBeneficiaryState(
        uiState: AddBeneficiaryErrors.reachedTheMax,
        loadingState: AddBeneficiaryLoadingState.idle,
      ));
    }
    state = state.copyWithAddBeneficiaryJustUiState(AddBeneficiaryState(
      uiState: AddBeneficiaryErrors.none,
      loadingState: AddBeneficiaryLoadingState.loading,
    ));

    // call the use case and then if success update the local state
    final result = await addBeneficiaryUseCase?.call(state.addFormBeneficiary!);
    result?.fold((error) {
      //TODO update state with this error
    }, (Beneficiary) {
      loggerNoStack.i("Beneficiary in successfully");
      // _beneficiaries.add(beneficiary);
      state = state.copyWithAddBeneficiaryJustUiState(AddBeneficiaryState(
        uiState: AddBeneficiaryErrors.success,
        loadingState: AddBeneficiaryLoadingState.idle,
      ));
    });
  }

  void remove(Beneficiary beneficiary) {
    // if (_beneficiaries.isEmpty || !_beneficiaries.remove(beneficiary)) {
    //   throw NoBeneficiaryException();
    // }
    // return _beneficiaries;
  }
}

class NoBeneficiaryException implements E5DError {}

class MaxReachedBeneficiariesException implements E5DError {}

class InvalidPhoneNumberException implements E5DError {}
