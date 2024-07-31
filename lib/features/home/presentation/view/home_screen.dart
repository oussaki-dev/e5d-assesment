import 'package:e5d_assesment/features/beneficiary/presentation/state/beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/view/beneficiary_list.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/viewmodel/benefeciary_viewmodel.dart';
import 'package:e5d_assesment/features/login/domain/model/session_notifier.dart';
import 'package:e5d_assesment/features/transactions/presentation/view/transaction_item_widget.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  BeneficiaryState? beneficiaryState;
  BeneficiaryViewModel? _beneficiaryViewModel;
  bool isGetBeneficiariesCalled = false;
  late SessionNotifier sessionNotifier;

  _logout(BuildContext context) {
    sessionNotifier.logout();
    LoginScreenRoute().go(context);
  }

  @override
  Widget build(BuildContext context, ref) {
    beneficiaryState = ref.watch(beneficiaryViewModelProvider);
    _beneficiaryViewModel = ref.read(beneficiaryViewModelProvider.notifier);
    final session = ref.watch(sessionProvider);
    sessionNotifier = ref.watch(sessionProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isGetBeneficiariesCalled) {
        isGetBeneficiariesCalled = true;
        _beneficiaryViewModel?.getBeneficiaries();
      }
    });

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
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .hello(session?.user?.firstName ?? ''),
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
                const Spacer(),
                TextButton(
                    onPressed: () => {_logout(context)},
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    )),
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
                    session?.user?.balance.toString() ?? '',
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
              AppLocalizations.of(context)!.title_beneficiaries,
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
            BeneficiaryListWidget(
              beneficiaries: beneficiaryState?.beneficiaries ?? List.empty(),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context)!.title_latest_top_ups,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.merge(const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: session?.user?.transactions.length ?? 0,
                itemBuilder: (context, index) {
                  final transaction = session?.user?.transactions[index];
                  if (transaction != null) {
                    return TransactionItemWidget(
                      transaction: transaction,
                      index: index,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
