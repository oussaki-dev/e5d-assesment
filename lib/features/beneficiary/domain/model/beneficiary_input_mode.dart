import 'package:e5d_assesment/features/beneficiary/domain/model/abstract_beneficiary.dart';

class BeneficiaryInput implements IBeneficiaryInput {
  BeneficiaryInput({
    required this.nickname,
    required this.mobileNumber,
  });

  @override
  String mobileNumber;

  @override
  String nickname;

  @override
  Map<String, dynamic> toJson() {
    return {'mobileNumber': mobileNumber, 'nickname': nickname};
  }
}
