abstract interface class AbstractTopUpRequest {
  late String beneficiaryId;
  late double amount;
  Map<String, dynamic> toJson();
}