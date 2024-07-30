import 'package:e5d_assesment/core/presentation/views/bottom_sheet.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/view/add_beneficiary_bottomsheet.dart';
import 'package:e5d_assesment/features/topup/presentation/view/topup_widget.dart';
import 'package:e5d_assesment/features/topup/presentation/viewmodel/topup_viewmodel.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddBeneficiaryButtonWidget extends StatelessWidget {
  const AddBeneficiaryButtonWidget({
    super.key,
  });

  void _onPressed(BuildContext context) {
    showE5DBottomSheet(
      context,
      const AddBeneficiaryWidget(),
      300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () {
          _onPressed(context);
        },
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: E5DColors.primaryColor20Percent,
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 16.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ic_add.png',
              width: 48,
              height: 48,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Add new",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.merge(
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
