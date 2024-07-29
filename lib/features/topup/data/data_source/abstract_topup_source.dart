



import 'package:e5d_assesment/features/topup/domain/model/abstract_topup_request.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';

abstract class AbstractTopUpSource {
  // Get all article
  Future<TopUpTransaction> topUp(AbstractTopUpRequest input);

  Future<List<TopUpTransaction>> getTransactions();
}
