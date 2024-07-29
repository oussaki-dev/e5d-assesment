import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/abstract_beneficiary.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/viewmodel/benefeciary_viewmodel.dart';

abstract interface class AbstractBeneficiaryRepository {

  Future<Either<AddBeneficiaryErrors, Beneficiary>> addBeneficiary(
      IBeneficiaryInput beneficiary);

  Future<Either<AddBeneficiaryErrors, Beneficiary>> removeBeneficiary(
      IBeneficiaryInput beneficiary);

  Future<Either<AddBeneficiaryErrors, List<Beneficiary>>> beneficiaries();
}
