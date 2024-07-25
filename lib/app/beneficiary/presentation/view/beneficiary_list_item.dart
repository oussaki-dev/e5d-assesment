import 'package:e5d_assesment/app/beneficiary/domain/model/beneficiary_model.dart';
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
      color: Colors.amber[50],
      key: ObjectKey("beneficiary${_beneficiary.id}"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              _beneficiary.nickname,
              maxLines: 2,
            ),
            Text(_beneficiary.phoneNumber),
            TextButton(
              onPressed: _onPressed,
              child: Text("Recharge now"),
            )
          ],
        ),
      ),
    );
  }
}
