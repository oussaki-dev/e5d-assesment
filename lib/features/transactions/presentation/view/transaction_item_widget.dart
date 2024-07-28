import 'package:e5d_assesment/features/transactions/domain/model/transaction_model.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget(
      {super.key, required this.transaction, required this.index});

  final Transaction transaction;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: index % 2 == 0
            ? E5DColors.colorFFF1DB
            : E5DColors.primaryColor80Percent,
      ),
      key: ObjectKey("beneficiary${transaction.beneficiary.id}"),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  transaction.beneficiary.nickname,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.merge(
                        TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  transaction.beneficiary.phoneNumber,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.merge(
                        TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('1 Dec',
                    style: Theme.of(context).textTheme.bodyMedium?.merge(
                          TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                Text(
                  '${transaction.amount.currency} ${transaction.amount.value}',
                  style: Theme.of(context).textTheme.bodyMedium?.merge(
                        TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
