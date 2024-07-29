import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/viewmodel/benefeciary_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ben1 = Beneficiary(
      id: '1', nickname: 'Beneficiary Test 1', phoneNumber: '0568330446');
  const ben2 = Beneficiary(
      id: '2', nickname: 'Beneficiary Test 2', phoneNumber: '+971568340446');
  const ben3 = Beneficiary(
      id: '3', nickname: 'Beneficiary Test 3', phoneNumber: '05623340446');

  const ben4 = Beneficiary(
      id: '4', nickname: 'Beneficiary Test 4', phoneNumber: '05623340446');
  const ben5 = Beneficiary(
      id: '5', nickname: 'Beneficiary Test 5', phoneNumber: '05623340446');

  const ben6 = Beneficiary(
      id: '6', nickname: 'Beneficiary Test 6', phoneNumber: '05623340446');

  const invalidUAEPhoneNumber = Beneficiary(
      id: '7', nickname: 'Beneficiary Test 2', phoneNumber: '623340446');

  test("The user can add a maximum of 5 active top-up beneficiaries.", () {
    final List<Beneficiary> list = List.empty(growable: true);
    final viewModel = BeneficiaryViewModel(beneficiaries: list);
    expect(viewModel.add(ben1).length, 1);
    expect(viewModel.add(ben2).length, 2);
    viewModel.add(ben3);
    viewModel.add(ben4);
    viewModel.add(ben5);
    expect(viewModel.beneficiaries.length, viewModel.maxToAdd);
    // expect(viewModel.add(ben6), throwsA(isA<Exception>()));
  });
  test("The user can remove beneficiaries.", () {
    final List<Beneficiary> list = List.empty(growable: true);
    final viewModel = BeneficiaryViewModel(beneficiaries: list);
    viewModel.add(ben1);
    viewModel.add(ben2);
    expect(viewModel.remove(ben2).length, 1);
    // expect(viewModel.remove(ben2), throwsException);
  });

  test("Phone Number validations.", () {
    final List<Beneficiary> list = List.empty(growable: true);
    final viewModel = BeneficiaryViewModel(beneficiaries: list);
    expect(viewModel.add(ben1).length, 1); // without country code
    expect(viewModel.add(ben2).length, 2); // with country code

    expect(viewModel.add(invalidUAEPhoneNumber), throwsException);
    // expect(viewModel.remove(ben2), throwsException);
  });
}
