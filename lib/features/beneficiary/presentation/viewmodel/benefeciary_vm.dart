import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:dlibphonenumber/dlibphonenumber.dart';


class BeneficiaryViewModel {
  BeneficiaryViewModel({required this.beneficiaries});

  List<Beneficiary> beneficiaries;

  // better to have this from a remote config for better control
  final maxToAdd = 5;

  /// nickname with a maximum length of 20 characters
  final nicknameMaxLength = 20;

  PhoneNumberUtil phoneUtil = PhoneNumberUtil.instance;

  List<Beneficiary> add(Beneficiary beneficiary) {
    // first we validate our inputs
    if (beneficiaries.length == maxToAdd) {
      throw MaxReachedBeneficiariesException();
    }
    if (beneficiary.nickname.isEmpty) {
      throw NicknameRequiredException();
    }

    if (beneficiary.nickname.trim().length > nicknameMaxLength) {
      throw NicknameTooLongException();
    }

    if (beneficiary.phoneNumber.isEmpty) {
      throw PhoneNumberRequiredException();
    }
    try {
      phoneUtil.parse(beneficiary.phoneNumber, "AE"); // will throw an exception
     } on NumberParseException catch (e) {
      throw InvalidPhoneNumberException();
    }

    beneficiaries.add(beneficiary);

    return beneficiaries;
  }

  List<Beneficiary> remove(Beneficiary beneficiary) {
    if (beneficiaries.isEmpty || !beneficiaries.remove(beneficiary)) {
      throw NoBeneficiaryException();
    }
    return beneficiaries;
  }
}

class NoBeneficiaryException implements Exception {}

class MaxReachedBeneficiariesException implements Exception {}

class NicknameRequiredException implements Exception {}

class NicknameTooLongException implements Exception {}

class PhoneNumberRequiredException implements Exception {}

class InvalidPhoneNumberException implements Exception {}
