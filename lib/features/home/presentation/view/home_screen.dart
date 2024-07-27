import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/view/beneficiary_list.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/view/beneficiary_list_item.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hello Oussama',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.merge(const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Total balance',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.merge(const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                key: ObjectKey("curren_balance_row"),
                children: [
                  Text(
                    '8,000',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.merge(const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: Text(
                      key: const ObjectKey("currency"),
                      'AED',
                      style: Theme.of(context).textTheme.titleLarge?.merge(
                          const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              color: E5DColors.color9E9999)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Beneficiaries',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.merge(const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
            const BeneficiaryListWidget(
              beneficiaries: [
                Beneficiary(
                  id: "1",
                  nickname: "oussama abdallah",
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
            const SizedBox(
              height: 12,
            ),
            Text(
              "Latest Top Up’s",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.merge(const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
