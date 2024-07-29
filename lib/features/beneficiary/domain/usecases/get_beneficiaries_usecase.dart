import 'package:e5d_assesment/features/beneficiary/data/repository/beneficiary_repository.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/repository/beneficiary_repository_interface.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/add_beneficiary_state.dart';
import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/get_beneficiaries_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

final getBeneficiariesUseCaseProvider =
    Provider<GetBeneficiariesUseCase>((ref) {
  final beneficiaryApi = ref.watch(beneficiaryRepositoryProvider);
  return GetBeneficiariesUseCase(beneficiaryApi);
});

class GetBeneficiariesUseCase
    extends UseCase<List<Beneficiary>, NoParams, GetBeneficiariesUiStates> {

  final AbstractBeneficiaryRepository repository;

  // injecting the repo for better testing
  GetBeneficiariesUseCase(this.repository);

  @override
  Future<Either<GetBeneficiariesUiStates, List<Beneficiary>>> call(
      NoParams _) async {
    // call the repository
    final result = await repository.getBeneficiaries();
    return result.fold((error) {
      return Left(error);
    }, (response) async {
      return Right(response);
    });
  }
}
