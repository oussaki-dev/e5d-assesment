import 'package:e5d_assesment/common/views/dash_separator.dart';
import 'package:e5d_assesment/common/views/half_circle.dart';
import 'package:e5d_assesment/main.dart';
import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';

class TopUpReceiptScreen extends StatelessWidget {
  const TopUpReceiptScreen({super.key});

  final cropsWith = 30.5;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraint) {
      final bottomCircleCount =
          ((constraint.maxWidth - 24) ~/ cropsWith).toInt();
      logger.d("width ; $bottomCircleCount");
      return SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: E5DColors.primaryColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    'Top Up Receipt',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.merge(const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          )),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Image.asset('assets/images/ic_checked.png'),
                          const SizedBox(height: 24),
                          Text(
                            'Top Up success',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.merge(const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Your top up has been successfully done.',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.merge(const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: E5DColors.color848484)),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Total top up',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.merge(const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: E5DColors.color848484)),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AED 30.00'.toUpperCase(),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomPaint(
                                size: const Size(
                                  30,
                                  30,
                                ), // Specify the size of the canvas
                                painter: HalfCirclePainter(
                                    Theme.of(context).primaryColor,
                                    CirclePosition.right),
                              ),
                              const Expanded(
                                child: DashSeparator(),
                              ),
                              CustomPaint(
                                size: const Size(
                                  30,
                                  30,
                                ), // Specify the size of the canvas
                                painter: HalfCirclePainter(
                                    Theme.of(context).primaryColor,
                                    CirclePosition.left),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding:
                                const EdgeInsetsDirectional.only(start: 16),
                            width: double.infinity,
                            child: Text(
                              'Top up destination',
                              style:
                                  Theme.of(context).textTheme.titleSmall?.merge(
                                        const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: E5DColors.color848484,
                                        ),
                                      ),
                            ),
                          ),
                          // Beneficiary information
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 16,
                              end: 16,
                              top: 16,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: E5DColors.primaryColor80Percent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Oussama Abdallah',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.merge(
                                          const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                  ),
                                  Text(
                                    '+971 568330446',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.merge(
                                          const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Done button
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            height: 44,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () => {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 8.0,
                                ),
                              ),
                              child: Text(
                                'Done',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.merge(const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Top up more money',
                            style:
                                Theme.of(context).textTheme.titleSmall?.merge(
                                      const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < bottomCircleCount; i++)
                                CustomPaint(
                                  size: Size(
                                    cropsWith,
                                    cropsWith,
                                  ), // Specify the size of the canvas
                                  painter: HalfCirclePainter(
                                    Theme.of(context).primaryColor,
                                    CirclePosition.top,
                                  ),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
