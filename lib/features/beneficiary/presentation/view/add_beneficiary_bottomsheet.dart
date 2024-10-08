import 'package:e5d_assesment/app.dart';
import 'package:e5d_assesment/core/presentation/state/screen_ui_states.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/add_beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/viewmodel/beneficiary_viewmodel.dart';
import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddBeneficiaryWidget extends ConsumerStatefulWidget {
  const AddBeneficiaryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddBeneficiaryWidgetState();
  }
}

class _AddBeneficiaryWidgetState extends ConsumerState<AddBeneficiaryWidget> {
  _AddBeneficiaryWidgetState();
  BeneficiaryViewModel? viewModel;
  BeneficiaryState? state;
  List<Widget> errorWidgets = List.empty(growable: true);

  Widget buildErrorLabel(String message) {
    return Text(
      '\u2022 $message',
      style: Theme.of(context).textTheme.labelSmall?.merge(
            const TextStyle(
                color: E5DColors.colorEF5A6F, fontWeight: FontWeight.w600),
          ),
    );
  }

  String _getTextButton() {
    if (state?.addState?.uiState == AddBeneficiaryErrors.success) {
      return AppLocalizations.of(context)!.button_add_beneficiary_success;
    } else {
      return AppLocalizations.of(context)!.button_add_beneficiary;
    }
  }

  Widget _getAddButtonInnerWidget() {
    if (state?.addState?.uiState == AddBeneficiaryErrors.loading) {
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
        _getTextButton(),
        style: Theme.of(context).textTheme.labelLarge?.merge(
              const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
      );
    }
  }

  void _onAddButtonPressed() {
    if (state?.addState?.uiState != AddBeneficiaryErrors.loading) {
      viewModel?.addBeneficiary();
    } else {
      loggerNoStack.i("Add beneficiary is already called ... ");
    }
  }

  Color _buttonColor() {
    if (state?.addState?.uiState == AddBeneficiaryErrors.success) {
      return E5DColors.colorSuccess;
    }
    return E5DColors.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    state = ref.watch(beneficiaryViewModelProvider);
    viewModel = ref.read(beneficiaryViewModelProvider.notifier);
    errorWidgets.clear();

    switch (state?.addState?.uiState) {
      case AddBeneficiaryErrors.nickNameTooLong:
        errorWidgets.add(
          buildErrorLabel('Nickname should be less than 20 characters.'),
        );
        break;
      case AddBeneficiaryErrors.nicknameRequired:
        errorWidgets.add(
          buildErrorLabel('Nickname is required.'),
        );
        break;

      case AddBeneficiaryErrors.mobileNumberRequired:
        errorWidgets.add(
          buildErrorLabel('Mobile number is required.'),
        );

      case AddBeneficiaryErrors.invalidMobileNumber:
        errorWidgets.add(
          buildErrorLabel('Invalid mobile number.'),
        );

      default:
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state?.addState?.uiState == AddBeneficiaryErrors.success) {
        scafoldKey.currentState?.showSnackBar(SnackBar(
          backgroundColor: E5DColors.colorSuccess,
          content: Text(
            AppLocalizations.of(context)!.button_add_beneficiary_success,
            style: const TextStyle(color: Colors.white),
          ),
        ));
        loggerNoStack.d("Called");
        viewModel?.resetState();
        Navigator.pop(context);
      }
    });

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Money to topup
          Expanded(
            child: SizedBox(
              // color: Colors.amber,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.title_add_new_beneficiary,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ...errorWidgets,
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      onChanged: (nickname) {
                        state?.addFormBeneficiary?.nickname = nickname;
                      },
                      style: Theme.of(context).textTheme.labelLarge,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: AppLocalizations.of(context)!
                              .title_beneficiary_nick_name,
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      onChanged: (mobileNumber) {
                        state?.addFormBeneficiary?.mobileNumber = mobileNumber;
                      },
                      style: Theme.of(context).textTheme.labelLarge,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: AppLocalizations.of(context)!
                              .title_example_mobile,
                          border: const OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Topup button
          SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              onPressed: () => {_onAddButtonPressed()},
              style: TextButton.styleFrom(
                shape: const LinearBorder(),
                backgroundColor: _buttonColor(),
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
              child: _getAddButtonInnerWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
