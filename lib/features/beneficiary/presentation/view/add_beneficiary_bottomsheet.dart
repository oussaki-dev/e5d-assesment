import 'package:e5d_assesment/features/beneficiary/domain/usecases/add_beneficiary_usecase.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/viewmodel/benefeciary_viewmodel.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddBeneficiaryWidget extends ConsumerStatefulWidget {
  const AddBeneficiaryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddBeneficiaryWidgetState();
  }
}

class _AddBeneficiaryWidgetState extends ConsumerState<AddBeneficiaryWidget> {
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
            child: TextButton(
              onPressed: () => {viewModel?.addBeneficiary()},
              style: TextButton.styleFrom(
                shape: const LinearBorder(),
                backgroundColor: E5DColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.button_add_beneficiary,
                style: Theme.of(context).textTheme.labelLarge?.merge(
                      const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
