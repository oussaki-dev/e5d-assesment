import 'package:e5d_assesment/features/beneficiary/presentation/view/beneficiary_list.dart';
import 'package:e5d_assesment/features/home/presentation/view/mock_beneficiaries.dart';
import 'package:e5d_assesment/features/topup/domain/model/money.dart';
import 'package:e5d_assesment/features/transactions/domain/model/transaction_model.dart';
import 'package:e5d_assesment/features/transactions/presentation/view/transaction_item_widget.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                const Icon(
                  Icons.settings,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              AppLocalizations.of(context)!.totalBalance,
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
                key: const ObjectKey("curren_balance_row"),
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
              beneficiaries: beneficiaries,
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
            const SizedBox(height: 16,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: 26,
                itemBuilder: (context, index) {
                  return TransactionItemWidget(
                    transaction: Transaction(
                      amount: const Money(currency: 'AED', value: 200.0),
                      beneficiary: beneficiaries.first,
                      id: index.toString(),
                      time: DateTime.now(),
                    ),
                    index: index,
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
