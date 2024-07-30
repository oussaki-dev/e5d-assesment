///
/// Against TopUpBeneficiaryUseCase
///
library;

import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/features/home/presentation/view/mock_data.dart';
import 'package:e5d_assesment/features/login/domain/model/session_model.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_request.dart';
import 'package:e5d_assesment/features/topup/domain/repository/abstract_topup_repository.dart';
import 'package:e5d_assesment/features/topup/domain/usecase/top_up_usecase.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_ui_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'beneficiary_test.mocks.dart';
import 'topup_tests.mocks.dart';

@GenerateMocks([AbstractTopUpRepository])
void main() {
  final fakeRepo = MockAbstractTopUpRepository();
  group('Top up negative cases', () {
    test("Should return an error when session is expired", () async {
      final usecase = TopUpBeneficiaryUseCase(
        fakeRepo,
        const Configurations(baseUrl: ""),
        const SessionModel(isLoggedIn: false),
      );
      expect(
        await usecase.call(TopUpRequest(beneficiaryId: '1', amount: 20)),
        const Left(TopUpUiStates.sessionExpired),
      );
    });

    test("should return an error when user is not having enough balance",
        () async {
      final usecase = TopUpBeneficiaryUseCase(
        fakeRepo,
        const Configurations(baseUrl: "", transactionFee: 1),
        const SessionModel(
            isLoggedIn: true,
            user: UserModel(
                firstName: '',
                lastName: '',
                token: '',
                refreshToken: '',
                isVerified: false,
                balance: 9,
                transactions: [])),
      );
      expect(
        await usecase.call(TopUpRequest(beneficiaryId: '1', amount: 20)),
        const Left(TopUpUiStates.noEnoughBalance),
      );
    });

    test("should return an error when user cant pay transaction fee", () async {
      final usecase = TopUpBeneficiaryUseCase(
        fakeRepo,
        const Configurations(baseUrl: "", transactionFee: 1),
        const SessionModel(
            isLoggedIn: true,
            user: UserModel(
                firstName: '',
                lastName: '',
                token: '',
                refreshToken: '',
                isVerified: false,
                balance: 10,
                transactions: [])),
      );
      expect(
        await usecase.call(TopUpRequest(beneficiaryId: '1', amount: 10)),
        const Left(TopUpUiStates.noEnoughBalance),
      );
    });

    test(
        "should return an error when balance is more than the amount and not able to pay the fee",
        () async {
      final usecase = TopUpBeneficiaryUseCase(
        fakeRepo,
        const Configurations(baseUrl: "", transactionFee: 2),
        const SessionModel(
            isLoggedIn: true,
            user: UserModel(
                firstName: '',
                lastName: '',
                token: '',
                refreshToken: '',
                isVerified: false,
                balance: 11,
                transactions: [])),
      );
      expect(
        await usecase.call(TopUpRequest(beneficiaryId: '1', amount: 10)),
        const Left(TopUpUiStates.noEnoughBalance),
      );
    });

    test(
        "should return an error when user is not verified and reached monthly threshold ",
        () async {
      final usecase = TopUpBeneficiaryUseCase(
        fakeRepo,
        const Configurations(baseUrl: "", transactionFee: 1),
        SessionModel(
            isLoggedIn: true,
            user: UserModel(
                firstName: '',
                lastName: '',
                token: '',
                refreshToken: '',
                isVerified: false,
                balance: 100,
                transactions: [
                  testTransactions[0],
                  testTransactions[0],
                  testTransactions[1],
                  testTransactions[0],
                  testTransactions[0],
                  testTransactions[0]
                ])),
      );
      expect(
        await usecase.call(TopUpRequest(beneficiaryId: '1', amount: 10)),
        const Left(TopUpUiStates.reachedMonthlyThresholdNonVerifiedUser),
      );
    });


     test(
        "should return an error when user is not verified and by toping up he will reach the monthly threshold ",
        () async {
      final usecase = TopUpBeneficiaryUseCase(
        fakeRepo,
        const Configurations(baseUrl: "", transactionFee: 1),
        SessionModel(
            isLoggedIn: true,
            user: UserModel(
                firstName: '',
                lastName: '',
                token: '',
                refreshToken: '',
                isVerified: false,
                balance: 500,
                transactions: [
                  testTransactions[0],
                  testTransactions[0],
                  testTransactions[1],
                  testTransactions[0],
                  testTransactions[0],
                ])),
      );
      expect(
        await usecase.call(TopUpRequest(beneficiaryId: '1', amount: 100)),
        const Left(TopUpUiStates.reachedMonthlyThresholdNonVerifiedUser),
      );
    });



  });


  

  // test("Nick name should be less than 20 characters.", () async {
  //   expect(
  //     await usecase.call(BeneficiaryInput(
  //       nickname: 'Oussama Abdallah 123456',
  //       mobileNumber: '',
  //     )),
  //     const Left(
  //       AddBeneficiaryErrors.nickNameTooLong,
  //     ),
  //   );
  // });

  // test("Inputs validation when adding beneficiary.", () async {
  //   expect(
  //     await usecase.call(BeneficiaryInput(
  //       nickname: 'Beneficiary Test 2',
  //       mobileNumber: '',
  //     )),
  //     const Left(AddBeneficiaryErrors.mobileNumberRequired),
  //   );
  // });

  // test("Should throw an error when phone is not valid for UAE", () async {
  //   expect(
  //     await usecase.call(
  //       BeneficiaryInput(
  //         nickname: 'Oussama Abdall',
  //         mobileNumber: '8220456',
  //       ),
  //     ),
  //     const Left(AddBeneficiaryErrors.invalidMobileNumber),
  //   );
  // });

  // test("It should continue to add it when phone is valid", () async {
  //   final input = BeneficiaryInput(
  //     nickname: 'Oussama Abdallah',
  //     mobileNumber: '568220456',
  //   );
  //   final expected = Right<AddBeneficiaryErrors, Beneficiary>(Beneficiary(
  //     id: '1',
  //     nickname: input.nickname,
  //     mobileNumber: input.mobileNumber,
  //   ));
  //   final answer = Future.value(expected);

  //   when(fakeRepo.addBeneficiary(input)).thenAnswer((_) {
  //     return answer;
  //   });

  //   expect(
  //     await usecase.call(
  //       input,
  //     ),
  //     expected,
  //   );
  // });
}
