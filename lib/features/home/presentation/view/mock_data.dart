import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/topup/domain/model/top_up_transaction.dart';

const beneficiaries = [
  Beneficiary(
    id: "1",
    nickname: "oussama abdallah",
    mobileNumber: "+971568330446",
  ),
  Beneficiary(
    id: "2",
    nickname: "Nabil benhamou asdas",
    mobileNumber: "+971568330446",
  ),
  Beneficiary(
    id: "3",
    nickname: "Sabeur Thabti",
    mobileNumber: "+971568330446",
  ),
  Beneficiary(
    id: "3",
    nickname: "Sabeur Thabti",
    mobileNumber: "+971568330446",
  ),
  Beneficiary(
    id: "3",
    nickname: "Sabeur Thabti",
    mobileNumber: "+971568330446",
  )
];

final testTransactions = [
  TopUpTransaction(
      transactionId: '1',
      timestamp: "",
      beneficiary: beneficiaries[0],
      amount: 100,
      currency: 'aed'),
  TopUpTransaction(
      transactionId: '2',
      timestamp: "",
      beneficiary: beneficiaries[1],
      amount: 100,
      currency: 'aed'),
  TopUpTransaction(
      transactionId: '3',
      timestamp: "",
      beneficiary: beneficiaries[0],
      amount: 100,
      currency: 'aed'),
  TopUpTransaction(
      transactionId: '3',
      timestamp: "",
      beneficiary: beneficiaries[1],
      amount: 100,
      currency: 'aed')
];
