import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paisa/src/core/enum/transaction_type.dart';
import 'package:paisa/src/presentation/widgets/month_total_widget.dart';

import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../core/enum/card_type.dart';
import '../../../data/accounts/model/account_model.dart';
import '../../../domain/expense/entities/expense.dart';
import '../../widgets/paisa_card.dart';

class AccountCardV2 extends StatelessWidget {
  const AccountCardV2({
    super.key,
    required this.account,
    required this.expenses,
  });
  final AccountModel account;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(seedColor: Color(account.color!));
    final color = colorScheme.primaryContainer;
    final onPrimary = colorScheme.onPrimaryContainer;
    final String total =
        (account.initialAmount + expenses.fullTotal).toFormateCurrency();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PaisaFilledCard(
        color: color,
        child: InkWell(
          onTap: () => GoRouter.of(context).pushNamed(
            accountTransactionName,
            params: <String, String>{'aid': account.superId.toString()},
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                horizontalTitleGap: 0,
                trailing: Icon(
                  account.cardType == null
                      ? CardType.bank.icon
                      : account.cardType!.icon,
                  color: onPrimary,
                ),
                title: Text(
                  account.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: onPrimary,
                      ),
                ),
                subtitle: Text(
                  account.bankName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: onPrimary.withOpacity(0.5),
                      ),
                ),
              ),
              ListTile(
                minVerticalPadding: 10,
                title: Text(
                  context.loc.totalBalance,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: onPrimary,
                      ),
                ),
                subtitle: Text(
                  total,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  context.loc.thisMonth,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: onPrimary,
                      ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: PaisaTransactionTailWidget(
                        transactionType: TransactionType.income,
                        content: expenses.thisMonthIncome.toFormateCurrency(),
                        color: onPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: PaisaTransactionTailWidget(
                        transactionType: TransactionType.expense,
                        color: onPrimary,
                        content: expenses.thisMonthExpense.toFormateCurrency(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
