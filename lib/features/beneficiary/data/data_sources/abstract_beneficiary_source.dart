import 'package:e5d_assesment/features/beneficiary/domain/model/abstract_beneficiary.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';

abstract class AbstractBeneficiarySource {
  // Get all article
  Future<Beneficiary> addBeneficiary(IBeneficiaryInput input);

  Future<Beneficiary> removeBeneficiary(IBeneficiaryInput beneficiary);

  Future<List<Beneficiary>> beneficiaries();
}
