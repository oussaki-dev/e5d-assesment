import 'package:e5d_assesment/core/network/network_exceptions.dart';
import 'package:e5d_assesment/features/beneficiary/data/data_sources/abstract_beneficiary_source.dart';
import 'package:e5d_assesment/features/beneficiary/data/data_sources/remote/beneficiary_api_impl.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/abstract_beneficiary.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/list_beneficiaries_response.dart';
import 'package:e5d_assesment/features/beneficiary/domain/repository/beneficiary_repository_interface.dart';
import 'package:e5d_assesment/core/network/error/errors.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/add_beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/get_beneficiaries_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/viewmodel/benefeciary_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

final beneficiaryRepositoryProvider =
    Provider<AbstractBeneficiaryRepository>((ref) {
  final beneficiaryApi = ref.watch(beneficiaryApiImplProvider);
  return BeneficiaryRepositoryImpl(beneficiaryApi);
});

class BeneficiaryRepositoryImpl implements AbstractBeneficiaryRepository {
  final AbstractBeneficiarySource _api;

  BeneficiaryRepositoryImpl(AbstractBeneficiarySource api) : _api = api;

  @override
  Future<Either<AddBeneficiaryErrors, Beneficiary>> addBeneficiary(
      IBeneficiaryInput beneficiary) async {
    try {
      Beneficiary added = await _api.addBeneficiary(beneficiary);
      return Right(added);
    } on E5DError catch (e) {
      if (e is NetworkException) {
        return const Left(AddBeneficiaryErrors.networkIssue);
      }
      return const Left(AddBeneficiaryErrors.genericError);
    }
  }

  @override
  Future<Either<GetBeneficiariesUiStates, List<Beneficiary>>>
      getBeneficiaries() async {
    try {
       List<Beneficiary> response = await _api.getBeneficiaries();
      return Right(response);
    } on E5DError catch (e) {
      if (e is NetworkException) {
        return const Left(GetBeneficiariesUiStates.networkIssue);
      }
      return const Left(GetBeneficiariesUiStates.genericError);
    }
  }

  @override
  Future<Either<AddBeneficiaryErrors, Beneficiary>> removeBeneficiary(
      IBeneficiaryInput beneficiary) {
    // TODO: implement removeBeneficiary
    throw UnimplementedError();
  }
}
