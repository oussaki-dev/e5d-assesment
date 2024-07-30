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

    group('When user is not verified', () {
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
          const Left(
              TopUpUiStates.alreadyReachedMonthlyThresholdNonVerifiedUser),
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

    group('When user is verified', () {
      const config = Configurations(baseUrl: "", transactionFee: 1);
      test(
          "Should return an error by toping up he will reach the monthly threshold ",
          () async {
        final usecase = TopUpBeneficiaryUseCase(
          fakeRepo,
          config,
          SessionModel(
              isLoggedIn: true,
              user: UserModel(
                  firstName: '',
                  lastName: '',
                  token: '',
                  refreshToken: '',
                  isVerified: true,
                  balance: 500,
                  transactions: [
                    // for test only this transaction has 1000 AED
                    testTransactions[2],
                  ])),
        );
        expect(
          await usecase.call(TopUpRequest(beneficiaryId: '1', amount: 100)),
          const Left(
              TopUpUiStates.alreadyReachedMonthlyThresholdNonVerifiedUser),
        );
      });

      test(
          "Should return an error by toping up he will reach the monthly threshold ",
          () async {
        final usecase = TopUpBeneficiaryUseCase(
          fakeRepo,
          config,
          SessionModel(
              isLoggedIn: true,
              user: UserModel(
                  firstName: '',
                  lastName: '',
                  token: '',
                  refreshToken: '',
                  isVerified: true,
                  balance: 500,
                  transactions: [
                    // for test only this transaction has 900 AED
                    testTransactions[3], // 900 AED
                  ])),
        );
        expect(
          await usecase.call(TopUpRequest(beneficiaryId: '1', amount: 100)),
          const Left(TopUpUiStates.reachedMonthlyThresholdNonVerifiedUser),
        );
      });
    });
  });
}
