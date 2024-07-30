import 'dart:ffi';

import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';

class TopUpState {
  final double selectedAmount;
  final Beneficiary? beneficiary;
  const TopUpState({this.selectedAmount = 0, required this.beneficiary});

  bool isSelectedAmount() {
    return selectedAmount != 0;
  }

  TopUpState updateSelectedTopUp(double value) {
    return TopUpState(selectedAmount: value, beneficiary: beneficiary);
  }

  TopUpState updateBeneficiary(Beneficiary beneficiary) {
    return TopUpState(selectedAmount: selectedAmount, beneficiary: beneficiary);
  }
}
