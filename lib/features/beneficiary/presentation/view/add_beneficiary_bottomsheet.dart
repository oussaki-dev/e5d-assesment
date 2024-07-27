import 'package:e5d_assesment/routes/routes.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';

class AddBeneficiaryWidget extends StatelessWidget {
  const AddBeneficiaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                      'Add a new beneficiary ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\u2022 Nickname should be less than 20 characters.',
                      style: Theme.of(context).textTheme.labelSmall?.merge(
                            const TextStyle(
                                color: E5DColors.colorEF5A6F,
                                fontWeight: FontWeight.w600),
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\u2022 Nickname should be less than 20 characters. ',
                      style: Theme.of(context).textTheme.labelSmall?.merge(
                            const TextStyle(
                                color: E5DColors.colorEF5A6F,
                                fontWeight: FontWeight.w600),
                          ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      style: Theme.of(context).textTheme.labelLarge,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Beneficiary nickname*',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      style: Theme.of(context).textTheme.labelLarge,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Ex: +971 56000000',
                          border: OutlineInputBorder()),
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
              onPressed: () => {TopUpScreenRoute().go(context)},
              style: TextButton.styleFrom(
                shape: const LinearBorder(),
                backgroundColor: E5DColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
              child: Text(
                'Add beneficiary',
                style: Theme.of(context).textTheme.labelLarge?.merge(
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600
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
