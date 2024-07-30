import 'package:e5d_assesment/features/topup/domain/model/money.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_state.dart';
import 'package:e5d_assesment/features/topup/presentation/view/topup_money_label.dart';
import 'package:e5d_assesment/features/topup/presentation/viewmodel/topup_viewmodel.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopUpWidget extends ConsumerStatefulWidget {
  const TopUpWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TopUpWidgetState();
  }
}

class _TopUpWidgetState extends ConsumerState<TopUpWidget> {
  TopUpViewModel? viewModel;
  TopUpState? state;

  void _onTopPressed() {
    if (state?.isSelectedAmount() == true) {
      viewModel?.topUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    state = ref.watch(topUpViewModelProvider);
    viewModel = ref.read(topUpViewModelProvider.notifier);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Money to topup
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'aed'.toUpperCase(),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        '${state?.selectedAmount}'.toUpperCase(),
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Wrap(
                    spacing: 8.0, // Horizontal spacing between children
                    runSpacing: 2.0, // Vertical spacing between lines
                    children: <Widget>[
                      ...[10, 20, 30, 50, 75, 100].map((v) {
                        return TopUpMoneyLabelWidget(
                          money: Money(currency: 'AED', value: v.toDouble()),
                          isSelected: state?.selectedAmount == v.toDouble(),
                        );
                      })
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Topup button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                _onTopPressed();
              },
              style: TextButton.styleFrom(
                shape: const LinearBorder(),
                backgroundColor: state?.isSelectedAmount() == true
                    ? Theme.of(context).primaryColor
                    : E5DColors.primaryColor40Percent,
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
              child: Text(
                'Top up AED ${state?.selectedAmount}'.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge?.merge(
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
