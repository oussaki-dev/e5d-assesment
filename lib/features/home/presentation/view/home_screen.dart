import 'package:e5d_assesment/core/network/config/config_notifier.dart';
import 'package:e5d_assesment/core/network/config/configurations_model.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/add_beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/beneficiary_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/state/get_beneficiaries_state.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/view/beneficiary_list.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/viewmodel/beneficiary_viewmodel.dart';
import 'package:e5d_assesment/features/login/domain/model/session_notifier.dart';
import 'package:e5d_assesment/features/transactions/presentation/view/transaction_item_widget.dart';
import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  BeneficiaryState? beneficiaryState;
  BeneficiaryViewModel? _beneficiaryViewModel;
  bool isGetBeneficiariesCalled = false;
  late SessionNotifier sessionNotifier;
  Configurations? configurations;

  _logout(BuildContext context) {
    sessionNotifier.logout();
    LoginScreenRoute().go(context);
  }

  Widget _getBeneficiariesWidget() {
    if (beneficiaryState?.listUiState?.uiState ==
        GetBeneficiariesUiStates.loading) {
      return Row(
        children: [
          for (int i = 0; i < 2; i++)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: Container(
                width: 155,
                height: 120,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Shimmer.fromColors(
                  baseColor: const Color.fromARGB(128, 204, 204, 204),
                  highlightColor: const Color.fromARGB(25, 204, 204, 204),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      );
    } else {
      return BeneficiaryListWidget(
        beneficiaries: beneficiaryState?.beneficiaries ?? List.empty(),
      );
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    beneficiaryState = ref.watch(beneficiaryViewModelProvider);
    _beneficiaryViewModel = ref.read(beneficiaryViewModelProvider.notifier);
    final session = ref.watch(sessionProvider);
    sessionNotifier = ref.watch(sessionProvider.notifier);
    configurations = ref.watch(configProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loggerNoStack.d(
          'beneficiaryState?.isGetBeneficiariesCalled ${beneficiaryState?.isGetBeneficiariesCalled}');
      if (beneficiaryState?.isGetBeneficiariesCalled == false) {
        _beneficiaryViewModel?.setApiCalled();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Column(
                  children: [
                    TextButton(
                        onPressed: () => {_logout(context)},
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                    // Text(configurations?.languageCode ?? "")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
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
              height: 20,
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
            _getBeneficiariesWidget(),
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
                itemCount: session?.user?.transactions?.length ?? 0,
                itemBuilder: (context, index) {
                  final transaction = session?.user?.transactions?[index];
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
