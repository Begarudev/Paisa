part of 'expense_bloc.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class AddExpenseEvent extends ExpenseEvent {
  final String amount;
  final String name;
  final DateTime time;
  final int categoryId;
  final int accountId;
  final TransactonType type;
  final bool isGoalExpense;
  final int? goalId;

  const AddExpenseEvent({
    required this.amount,
    required this.name,
    required this.time,
    required this.categoryId,
    required this.accountId,
    required this.type,
    this.isGoalExpense = false,
    this.goalId,
  });
}

class UpdateExpenseEvent extends ExpenseEvent {
  final Expense expense;
  final double amount;
  const UpdateExpenseEvent({
    required this.expense,
    required this.amount,
  });
}

class ClearExpenseEvent extends ExpenseEvent {
  final Expense expense;

  const ClearExpenseEvent(this.expense);
}

class ChangeExpenseEvent extends ExpenseEvent {
  final TransactonType transactionType;

  const ChangeExpenseEvent(this.transactionType);
}
