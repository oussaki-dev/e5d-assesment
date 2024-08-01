import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

showE5DBottomSheet(
  BuildContext context,
  Widget customWidget,
  double maxHeight,
) {
  // Unfocus the current focus node to dismiss the keyboard if it is open
  FocusManager.instance.primaryFocus?.unfocus();

  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(18),
      ),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: maxHeight, // Set your maximum height here
            ),
            child: BottomSheetChildViewContainer(customWidget: customWidget),
          ),
        ),
      );
    },
  );
}

class BottomSheetChildViewContainer extends StatelessWidget {
  final Widget customWidget;

  const BottomSheetChildViewContainer({super.key, required this.customWidget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 67,
                  height: 3,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
            customWidget
          ],
        ),
      ));
  }
}
