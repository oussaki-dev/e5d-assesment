import 'package:e5d_assesment/features/topup/domain/model/money.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';

class TopUpMoneyLabelWidget extends StatelessWidget {
  final Money money;
  final bool isSelected;
  Color backgroundColor = E5DColors.primaryColor80Percent;
  Color textColor = Colors.black;

  TopUpMoneyLabelWidget(
      {super.key, required this.money, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      backgroundColor = Theme.of(context).primaryColor;
      textColor = Colors.white;
    }

    return Container(
      child: TextButton(
        onPressed: () => {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 12.0,
          ),
        ),
        child: Text(
          '${money.currency} ${money.value}',
          style: Theme.of(context).textTheme.labelLarge?.merge(
                TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    );
  }
}
