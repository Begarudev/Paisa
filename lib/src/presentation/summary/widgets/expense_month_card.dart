import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/common.dart';
import '../../../core/theme/custom_color.dart';
import '../../../domain/expense/entities/expense.dart';
import '../../widgets/paisa_card.dart';
import 'expense_list_widget.dart';

class ExpenseMonthCardWidget extends StatelessWidget {
  const ExpenseMonthCardWidget({
    Key? key,
    required this.title,
    required this.total,
    required this.expenses,
  }) : super(key: key);

  final List<Expense> expenses;
  final String title;
  final double total;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: PaisaFilledCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                title,
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              trailing: Text(
                total.toCurrency(),
                style: GoogleFonts.manrope(
                  textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: total.isNegative
                            ? Theme.of(context).extension<CustomColors>()!.red
                            : Theme.of(context)
                                .extension<CustomColors>()!
                                .green,
                      ),
                ),
              ),
            ),
            ExpenseListWidget(expenses: expenses),
          ],
        ),
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              title,
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w600,
                textStyle: Theme.of(context).textTheme.titleMedium,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            trailing: Text(
              total.toCurrency(),
              style: GoogleFonts.manrope(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: total.isNegative
                          ? Theme.of(context).extension<CustomColors>()!.red
                          : Theme.of(context).extension<CustomColors>()!.green,
                    ),
              ),
            ),
          ),
          ExpenseListWidget(expenses: expenses),
        ],
      ),
    );
  }
}
