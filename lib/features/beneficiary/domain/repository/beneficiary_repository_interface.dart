import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';

abstract interface class IBeneficiaryRepository {

  Future<Beneficiary> addBeneficiary(Beneficiary beneficiary);
  Future<Beneficiary> removeBeneficiary(Beneficiary beneficiary);
  Future<List<Beneficiary>> beneficiaries();
  
}
