import 'package:e5d_assesment/features/topup/domain/model/money.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';

class TopUpMoneyLabelWidget extends StatelessWidget {
  final Money money;

  const TopUpMoneyLabelWidget({super.key, required this.money});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () => {},
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: E5DColors.primaryColor40Percent,
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 4.0,
          ),
        ),
        child: Text(
          '${money.currency} ${money.value}',
          style: Theme.of(context).textTheme.labelLarge?.merge(const TextStyle(
                color: Colors.white,
                fontSize: 12,
              )),
        ),
      ),
    );
  }
}
