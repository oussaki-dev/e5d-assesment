import 'abstract_topup_request.dart';

class TopUpRequest implements AbstractTopUpRequest {
  
  TopUpRequest({
    required this.beneficiaryId,
    required this.amount,
  });

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount, 'beneficiaryId': beneficiaryId};
  }

  @override
  double amount;

  @override
  String beneficiaryId;
}
