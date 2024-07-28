import 'package:e5d_assesment/common/views/bottom_sheet.dart';
import 'package:e5d_assesment/features/beneficiary/domain/model/beneficiary_model.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/view/add_beneficiary_bottomsheet.dart';
import 'package:e5d_assesment/features/beneficiary/presentation/view/beneficiary_list_item.dart';
import 'package:e5d_assesment/main.dart';
import 'package:flutter/material.dart';

class BeneficiaryListWidget extends StatelessWidget {
  const BeneficiaryListWidget({
    super.key,
    required List<Beneficiary> beneficiaries,
  }) : _beneficiaries = beneficiaries;

  final List<Beneficiary> _beneficiaries;
  final double spacingBetweenItems = 8.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraint) {
      ///
      /// we can consider that there is always a 20% reserved for the last item visible
      /// so the rest of the first visible elements  will try to render in the 80% dynamically
      /// we can use LayoutBuilder as it helps providing the constraint even if the screen configuration
      /// changes on runtime.
      ///
      final calculatedWidth =
          ((constraint.maxWidth * 0.8) / 2) - spacingBetweenItems;
      loggerNoStack.d("CalculatedWidth $calculatedWidth ");

      return SizedBox(
          height: 110,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                width: spacingBetweenItems,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: _beneficiaries.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: calculatedWidth,
                child: BeneficiaryListItemWidget(
                    beneficiary: _beneficiaries[index],
                    onPressed: () {
                      // showE5DBottomSheet(
                      //   context,
                      //   const TopUpWidget(),
                      //   300,
                      // );

                      showE5DBottomSheet(
                        context,
                        const AddBeneficiaryWidget(),
                        300,
                      );

                     
                    }),
              );
            },
          ));
    });
  }
}
