import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_input_mode.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/repository/beneficiary_repository_interface.dart';
import 'package:e5d_assesment/features/beneficiary/domain/usecases/add_beneficiary_usecase.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/viewmodel/benefeciary_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'beneficiary_test.mocks.dart';

@GenerateMocks([AbstractBeneficiaryRepository])
void main() {
  final fakeRepo = MockAbstractBeneficiaryRepository();
  final usecase = AddBeneficiaryUseCase(fakeRepo);

  test("Nick name is required.", () async {
    expect(
      await usecase.call(BeneficiaryInput(
        nickname: '',
        mobileNumber: '',
      )),
      const Left(AddBeneficiaryErrors.nicknameRequired),
    );
  });

  test("Nick name should be less than 20 characters.", () async {
    expect(
      await usecase.call(BeneficiaryInput(
        nickname: 'Oussama Abdallah 123456',
        mobileNumber: '',
      )),
      const Left(
        AddBeneficiaryErrors.nickNameTooLong,
      ),
    );
  });

  test("Inputs validation when adding beneficiary.", () async {
    expect(
      await usecase.call(BeneficiaryInput(
        nickname: 'Beneficiary Test 2',
        mobileNumber: '',
      )),
      const Left(AddBeneficiaryErrors.mobileNumberRequired),
    );
  });

  test("Should throw an error when phone is not valid for UAE", () async {
    expect(
      await usecase.call(
        BeneficiaryInput(
          nickname: 'Oussama Abdall',
          mobileNumber: '8220456',
        ),
      ),
      const Left(AddBeneficiaryErrors.invalidMobileNumber),
    );
  });

  test("It should continue to add it when phone is valid", () async {
    final input = BeneficiaryInput(
      nickname: 'Oussama Abdallah',
      mobileNumber: '568220456',
    );
    final expected = Right<AddBeneficiaryErrors, Beneficiary>(Beneficiary(
      id: '1',
      nickname: input.nickname,
      mobileNumber: input.mobileNumber,
    ));
    final answer = Future.value(expected);

    when(fakeRepo.addBeneficiary(input)).thenAnswer((_) {
      return answer;
    });

    expect(
      await usecase.call(
        input,
      ),
      expected,
    );
  });
}
