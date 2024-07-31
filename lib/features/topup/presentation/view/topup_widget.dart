import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/topup/domain/model/money.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_state.dart';
import 'package:e5d_assesment/features/topup/presentation/state/topup_ui_states.dart';
import 'package:e5d_assesment/features/topup/presentation/view/topup_money_label.dart';
import 'package:e5d_assesment/features/topup/presentation/view/topup_receipt_screen.dart';
import 'package:e5d_assesment/features/topup/presentation/viewmodel/topup_viewmodel.dart';
import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopUpWidget extends ConsumerStatefulWidget {
  final Beneficiary beneficiary;
  const TopUpWidget({super.key, required this.beneficiary});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TopUpWidgetState(beneficiary: beneficiary);
  }
}

class _TopUpWidgetState extends ConsumerState<TopUpWidget> {
  TopUpViewModel? viewModel;
  TopUpState? topUpState;
  TopUpState? topUpStateRead;

  final Beneficiary beneficiary;
  Configurations? config;

  _TopUpWidgetState({required this.beneficiary});

  void _onTopPressed() {
    if (topUpState?.isSelectedAmount() == true) {
      viewModel?.topUp();
    }
  }

  Color getButtonBackgroundColor() {
    if (topUpState?.uiState == TopUpUiStates.successfulTransaction) {
      return E5DColors.colorSuccess;
    } else {
      return topUpState?.isSelectedAmount() == true
          ? Theme.of(context).primaryColor
          : E5DColors.primaryColor40Percent;
    }
  }

  String? _getButtonText() {
    if (topUpState?.uiState == TopUpUiStates.successfulTransaction) {
      return AppLocalizations.of(context)?.top_up_successfuly;
    }
    return 'Top up AED ${topUpState?.selectedAmount} to ${topUpState?.beneficiary?.nickname}';
  }

  Widget _getTransactionErrorWidget() {
    String message = '';
    switch (topUpState?.uiState) {
      case TopUpUiStates.noEnoughBalance:
        message = AppLocalizations.of(context)!.top_up_not_enough_balance;
        break;

      case TopUpUiStates.reachedMonthlyTopUpThreshold:
        message = AppLocalizations.of(context)!.top_up_reached_total_threshold(
            config?.monthlyMaxTopUpThreshold?.toString() ?? '');
        break;

      case TopUpUiStates.reachedMonthlyThresholdNonVerifiedUser ||
            TopUpUiStates.reachedMonthlyThresholdVerifiedUser:
        message =
            AppLocalizations.of(context)!.top_up_threshold_one_beneficiary;
        break;

      case TopUpUiStates.alreadyReachedMonthlyThresholdNonVerifiedUser ||
            TopUpUiStates.alreadyReachedMonthlyThresholdVerifiedUser:
        message =
            AppLocalizations.of(context)!.top_up_already_reached_threshold;
        break;

      case TopUpUiStates.failedTransaction:
        message = AppLocalizations.of(context)!.error_generic;
        break;

      case TopUpUiStates.networkIssue:
        message = AppLocalizations.of(context)!.error_network_issue;
        break;
      default:
        message = '';
    }

    if (message.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: Theme.of(context).textTheme.labelLarge?.merge(const TextStyle(
                color: Colors.white,
                fontSize: 12,
              )),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  void _checkOpenReceiptScreen() {
    if (topUpState?.uiState == TopUpUiStates.successfulTransaction) {
      Future.microtask(() {
        final amount = topUpStateRead?.transaction?.amount;
        loggerNoStack.i('amount = $amount');
        TopUpReceiptScreenRoute(
                amount: amount,
                beneficiaryName: topUpStateRead?.beneficiary?.nickname ?? '',
                mobileNumber: topUpStateRead?.beneficiary?.mobileNumber ?? '')
            .go(context);
      });
    }
  }

  Widget getTopUpButtonInnerWidget() {
    if (topUpState?.uiState == TopUpUiStates.loading) {
      return SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          strokeWidth: 3.0,
        ),
      );
    } else {
      return Text(
        _getButtonText()?.toUpperCase() ?? "",
        style: Theme.of(context).textTheme.labelLarge?.merge(
              const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    topUpState = ref.watch(topUpViewModelProvider);
    topUpStateRead = ref.read(topUpViewModelProvider);
    viewModel = ref.read(topUpViewModelProvider.notifier);
    config = ref.read(configProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel?.updateBeneficiary(beneficiary);
      _checkOpenReceiptScreen();
    });

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
                        '${topUpState?.selectedAmount}'.toUpperCase(),
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
                          isSelected:
                              topUpState?.selectedAmount == v.toDouble(),
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
            child: Container(
              color: E5DColors.colorEF5A6F,
              child: Column(
                children: [
                  _getTransactionErrorWidget(),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        _onTopPressed();
                      },
                      style: TextButton.styleFrom(
                        shape: const LinearBorder(),
                        backgroundColor: getButtonBackgroundColor(),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                      ),
                      child: getTopUpButtonInnerWidget(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}
