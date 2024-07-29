



import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/abstract_beneficiary.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/add_beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/get_beneficiaries_state.dart';
import 'package:e5d_assesment/features/topup/domain/model/abstract_topup_request.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';
import 'package:e5d_assesment/features/topup/presentation/state/get_transactions_ui_states.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_ui_states.dart';

abstract interface class AbstractTopUpRepository {

  Future<Either<TopUpUiStates, TopUpTransaction>> topUp(
      AbstractTopUpRequest request);

  Future<Either<GetTransactionsUiStates, List<TopUpTransaction>>> getTransactions();
}
