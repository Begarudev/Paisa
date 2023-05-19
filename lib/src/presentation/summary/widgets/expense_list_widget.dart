import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/src/core/common.dart';

import '../../../../main.dart';
import '../../../domain/account/entities/account.dart';
import '../../../domain/category/entities/category.dart';
import '../../../domain/expense/entities/expense.dart';
import '../../widgets/paisa_empty_widget.dart';
import '../controller/summary_controller.dart';
import 'expense_item_widget.dart';

class ExpenseListWidget extends StatelessWidget {
  const ExpenseListWidget({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return EmptyWidget(
        title: context.loc.emptyExpensesMessageTitle,
        icon: Icons.money_off_rounded,
        description: context.loc.emptyExpensesMessageSubTitle,
      );
    }
    final SummaryController summaryController = getIt.get();
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        indent: 72,
        height: 0,
      ),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: expenses.length,
      itemBuilder: (_, index) {
        final Expense expense = expenses[index];
        /* if (expense.type == TransactionType.transfer) {
          final Account? fromAccount =
              summaryController.getAccount(expenses[index].fromAccountId!);
          final Account? toAccount =
              summaryController.getAccount(expenses[index].toAccountId!);

          if (fromAccount == null || toAccount == null) {
            return const SizedBox.shrink();
          } else {
            return ExpenseTransferItemWidget(
              expense: expense,
              fromAccount: fromAccount,
              toAccount: toAccount,
            );
          }
        } else { */
        final Account? account =
            summaryController.getAccount(expenses[index].accountId);
        final Category? category =
            summaryController.getCategory(expenses[index].categoryId);
        if (account == null || category == null) {
          return ExpenseItemWidget(
            expense: expenses[index],
            account: account!,
            category: Category(
              icon: MdiIcons.bankTransfer.codePoint,
              name: 'Transfer',
              color: Colors.amber.value,
            ),
          );
        } else {
          return ExpenseItemWidget(
            expense: expense,
            account: account,
            category: category,
          );
        }
        //}
      },
    );
  }
}
