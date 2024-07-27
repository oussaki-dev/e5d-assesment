import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/repository/beneficiary_repository_interface.dart';

class BeneficiaryRepository implements IBeneficiaryRepository {
   
  @override
  Future<Beneficiary> addBeneficiary(Beneficiary beneficiary) {
    // TODO: implement addBeneficiary
    throw UnimplementedError();
  }

  @override
  Future<List<Beneficiary>> beneficiaries() {
    // TODO: implement beneficiaries
    throw UnimplementedError();
  }

  @override
  Future<Beneficiary> removeBeneficiary(Beneficiary beneficiary) {
    // TODO: implement removeBeneficiary
    throw UnimplementedError();
  }
  
}