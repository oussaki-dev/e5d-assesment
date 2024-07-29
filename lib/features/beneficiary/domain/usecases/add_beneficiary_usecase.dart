import 'package:e5d_assesment/features/beneficiary/data/repository/beneficiary_repository.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/abstract_beneficiary.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/repository/beneficiary_repository_interface.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/add_beneficiary_state.dart';
import 'package:e5d_assesment/core/domain/base_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dlibphonenumber/dlibphonenumber.dart';
import 'package:dartz/dartz.dart';

final addBeneficiaryUseCaseProvider = Provider<AddBeneficiaryUseCase>((ref) {
  final beneficiaryApi = ref.watch(beneficiaryRepositoryProvider);
  return AddBeneficiaryUseCase(beneficiaryApi);
});

class AddBeneficiaryUseCase
    extends UseCase<Beneficiary, IBeneficiaryInput, AddBeneficiaryErrors> {
  final AbstractBeneficiaryRepository repository;
  PhoneNumberUtil phoneUtil = PhoneNumberUtil.instance;

  /// nickname with a maximum length of 20 characters
  final nicknameMaxLength = 20;
  final regionCode = 'AE';

  // injecting the repo for better testing
  AddBeneficiaryUseCase(this.repository);

  @override
  Future<Either<AddBeneficiaryErrors, Beneficiary>> call(
      IBeneficiaryInput beneficiary) async {
    if (beneficiary.nickname.isEmpty) {
      return const Left(AddBeneficiaryErrors.nicknameRequired);
    }

    if (beneficiary.nickname.trim().length > nicknameMaxLength) {
      return const Left(AddBeneficiaryErrors.nickNameTooLong);
    }

    if (beneficiary.mobileNumber.isEmpty) {
      return const Left(AddBeneficiaryErrors.mobileNumberRequired);
    }
    try {
      // parse the number 
      final number = phoneUtil.parse(
          beneficiary.mobileNumber, regionCode); // will throw an exception
      // validate it 
      if (!phoneUtil.isValidNumberForRegion(number, regionCode)) {
        return const Left(AddBeneficiaryErrors.invalidMobileNumber);
      }

    } on NumberParseException catch (_) {
      return const Left(AddBeneficiaryErrors.invalidMobileNumber);
    }

    // call the repository
    final result = await repository.addBeneficiary(beneficiary);

    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
