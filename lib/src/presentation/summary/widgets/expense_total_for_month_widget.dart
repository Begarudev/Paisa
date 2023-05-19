import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/common.dart';
import '../../../core/theme/custom_color.dart';

class ExpenseTotalForMonthWidget extends StatelessWidget {
  const ExpenseTotalForMonthWidget({
    Key? key,
    required this.income,
    required this.outcome,
  }) : super(key: key);

  final double income;
  final double outcome;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: const ScreenBreakpoints(
        tablet: 600,
        desktop: 700,
        watch: 300,
      ),
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.thisMonth,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.85),
                ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '▼',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .green,
                            ),
                        children: [
                          TextSpan(
                            text: context.loc.income,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '+${income.toCurrency()}',
                      style: GoogleFonts.manrope(
                        textStyle:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '▲',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .red,
                            ),
                        children: [
                          TextSpan(
                            text: context.loc.expense,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '-${outcome.toCurrency()}',
                      style: GoogleFonts.manrope(
                        textStyle:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      tablet: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.thisMonth,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.85),
                ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '▼',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            Theme.of(context).extension<CustomColors>()!.green,
                      ),
                  children: [
                    TextSpan(
                      text: context.loc.income,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                '+${income.toCurrency()}',
                style: GoogleFonts.manrope(
                  textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '▲',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).extension<CustomColors>()!.red,
                      ),
                  children: [
                    TextSpan(
                      text: context.loc.expense,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                '-${outcome.toCurrency()}',
                style: GoogleFonts.manrope(
                  textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
      desktop: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.thisMonth,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.85),
                ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '▼',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .green,
                            ),
                        children: [
                          TextSpan(
                            text: context.loc.income,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '+${income.toCurrency()}',
                      style: GoogleFonts.manrope(
                        textStyle:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '▲',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .red,
                            ),
                        children: [
                          TextSpan(
                            text: context.loc.expense,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '-${outcome.toCurrency()}',
                      style: GoogleFonts.manrope(
                        textStyle:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
