import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_input_mode.dart';
import 'package:e5d_assesment/features/beneficiary/domain/usecases/add_beneficiary_usecase.dart';
import 'package:e5d_assesment/features/beneficiary/domain/usecases/get_beneficiaries_usecase.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/add_beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/get_beneficiaries_state.dart';
import 'package:e5d_assesment/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beneficiary_viewmodel.g.dart';

@riverpod
class BeneficiaryViewModel extends _$BeneficiaryViewModel {
  AddBeneficiaryUseCase? addBeneficiaryUseCase;
  GetBeneficiariesUseCase? getBeneficiariesUseCase;

  @override
  BeneficiaryState build() {
    addBeneficiaryUseCase = ref.read(addBeneficiaryUseCaseProvider);
    getBeneficiariesUseCase = ref.read(getBeneficiariesUseCaseProvider);

    return BeneficiaryState(
      addFormBeneficiary: BeneficiaryInput(
        nickname: '',
        mobileNumber: '',
      ),
      beneficiaries: List.empty(),
      addState: AddBeneficiaryState(
        uiState: AddBeneficiaryErrors.none,
      ),
      removeUiState: ScreenUiState.idle,
      listUiState: GetBeneficiariesState(
        uiState: GetBeneficiariesUiStates.idle,
      ),
    );
  }

  // BeneficiaryViewModel({required this.addBeneficiaryUseCase});

  // better to have this from a remote config for better control
  final maxToAdd = 5;

  void addBeneficiary() async {
    // first we validate our inputs
    if (state.beneficiaries?.length == maxToAdd) {
      state = state.copyWith(
          addState: AddBeneficiaryState(
        uiState: AddBeneficiaryErrors.reachedTheMax,
      ));

      state = state.copyWith(
          addState: AddBeneficiaryState(
        uiState: AddBeneficiaryErrors.reachedTheMax,
      ));
    }

    // Push loading state to the consumers
    state = state.copyWith(
        addState: AddBeneficiaryState(
      uiState: AddBeneficiaryErrors.loading,
    ));

    // call the use case and then if success update the local state
    final result = await addBeneficiaryUseCase?.call(state.addFormBeneficiary!);
    result?.fold((error) {
      loggerNoStack.e(error);
      state = state.copyWith(
          addState: AddBeneficiaryState(
        uiState: error,
      ));
    }, (beneficiary) {
      // save it in local list of beneficiaries
      // _beneficiaries.add(beneficiary);
      state = state.copyWithNewBeneficiary(
        beneficiary,
        AddBeneficiaryState(
          uiState: AddBeneficiaryErrors.success,
        ),
      );
      loggerNoStack.i(
          "Beneficiary in successfully $beneficiary in list we have ${state.beneficiaries?.length}");
    });
  }

  void getBeneficiaries() async {
    state = state.copyWith(
      listUiState: GetBeneficiariesState(
        uiState: GetBeneficiariesUiStates.loading,
      ),
    );

    final result = await getBeneficiariesUseCase?.call(NoParams());

    result?.fold((error) {
      loggerNoStack.e(error);
      state = state.copyWith(
        listUiState: GetBeneficiariesState(
          uiState: error,
        ),
      );
    }, (beneficiaries) {
      // save it in local list of beneficiaries
      // _beneficiaries.add(beneficiary);

      state = state.copyWith(
        beneficiaries: beneficiaries,
        listUiState: GetBeneficiariesState(
          uiState: GetBeneficiariesUiStates.success,
        ),
      );
      loggerNoStack.i(
          "we've got a list of beneficiaries sized : ${beneficiaries.length}");
    });
  }

  void resetState() {
    state = state.reset();
  }

  void setApiCalled() {
    state = state.copyWith(isGetBeneficiariesCalled: true);
  }
}
