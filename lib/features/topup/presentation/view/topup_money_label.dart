import 'package:e5d_assesment/features/topup/domain/model/money.dart';
import 'package:e5d_assesment/features/topup/presentation/viewmodel/topup_viewmodel.dart';
import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopUpMoneyLabelWidget extends ConsumerWidget {
  final Money money;
  Color backgroundColor = E5DColors.primaryColor80Percent;
  Color textColor = Colors.black;
  final bool isSelected;

  TopUpMoneyLabelWidget(
      {super.key, required this.money, required this.isSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(topUpViewModelProvider.notifier);

    if (isSelected) {
      backgroundColor = Theme.of(context).primaryColor;
      textColor = Colors.white;
    }

    return Container(
      child: TextButton(
        onPressed: () => {viewModel.updateTopUp(money.value)},
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
