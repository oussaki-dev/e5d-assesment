import 'package:e5d_assesment/core/presentation/views/bottom_sheet.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/topup/presentation/view/topup_widget.dart';
import 'package:e5d_assesment/features/topup/presentation/viewmodel/topup_viewmodel.dart';
import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BeneficiaryListItemWidget extends StatelessWidget {
  BeneficiaryListItemWidget({
    super.key,
    required Beneficiary beneficiary,
  }) : _beneficiary = beneficiary;

  final Beneficiary _beneficiary;
  TopUpViewModel? topUpViewModel;

  void _onPressed(BuildContext context) {
    showE5DBottomSheet(
      context,
      TopUpWidget(
        beneficiary: _beneficiary,
      ),
      300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: E5DColors.primaryColor20Percent,
      ),
      key: ObjectKey("beneficiary${_beneficiary.id}"),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _beneficiary.nickname ?? "",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.merge(
                    const TextStyle(
                      color: E5DColors.colorFFF1DB,
                      fontSize: 14,
                    ),
                  ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              _beneficiary.mobileNumber ?? "",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.merge(
                    const TextStyle(
                      color: E5DColors.colorFFF1DB,
                      fontSize: 12,
                    ),
                  ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  _onPressed(context);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: E5DColors.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 16.0,
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.button_recharge_now,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.merge(const TextStyle(
                        color: E5DColors.colorFFF1DB,
                        fontSize: 11,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
