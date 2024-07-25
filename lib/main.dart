import 'package:e5d_assesment/app/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/app/beneficiary/presentation/view/beneficiary_list.dart';
import 'package:e5d_assesment/app/beneficiary/presentation/view/beneficiary_list_item.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

 var  loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);


void main() {
  runApp(const E5DApp());
}

class E5DApp extends StatelessWidget {
  const E5DApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E5D',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Beneficiaries"),
            SizedBox(
              height: 50,
            ),
            BeneficiaryListWidget(
              beneficiaries: [
                Beneficiary(
                  id: "1",
                  nickname: "oussama abdallah1234",
                  phoneNumber: "+971568330446",
                ),
                Beneficiary(
                  id: "2",
                  nickname: "Nabil benhamou asdas",
                  phoneNumber: "+971568330446",
                ),
                Beneficiary(
                  id: "3",
                  nickname: "Sabeur Thabti",
                  phoneNumber: "+971568330446",
                ),
                Beneficiary(
                  id: "3",
                  nickname: "Sabeur Thabti",
                  phoneNumber: "+971568330446",
                ),
                Beneficiary(
                  id: "3",
                  nickname: "Sabeur Thabti",
                  phoneNumber: "+971568330446",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
