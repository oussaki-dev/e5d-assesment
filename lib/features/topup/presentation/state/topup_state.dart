import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';

class TopUpState {
  final double selectedAmount;
  final Beneficiary? beneficiary;
  const TopUpState({this.selectedAmount = 0.1, required this.beneficiary});

  TopUpState updateSelectedTopUp(double value) {
    return TopUpState(selectedAmount: value, beneficiary: beneficiary);
  }

  TopUpState updateBeneficiary(Beneficiary beneficiary) {
    return TopUpState(selectedAmount: selectedAmount, beneficiary: beneficiary);
  }
}
