import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';

class BeneficiaryListItemWidget extends StatelessWidget {
  const BeneficiaryListItemWidget({
    super.key,
    required Beneficiary beneficiary,
    required VoidCallback? onPressed,
  })  : _beneficiary = beneficiary,
        _onPressed = onPressed;

  final Beneficiary _beneficiary;
  final VoidCallback? _onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: E5DColors.primaryColor20Percent,
      ),
      key: ObjectKey("beneficiary${_beneficiary.id}"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _beneficiary.nickname,
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
              _beneficiary.phoneNumber,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.merge(
                    const TextStyle(
                      color: E5DColors.colorFFF1DB,
                      fontSize: 12,
                    ),
                  ),
            ),
            TextButton(
              onPressed: _onPressed,
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
                "Recharge now",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.merge(const TextStyle(
                      color: E5DColors.colorFFF1DB,
                      fontSize: 11,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
