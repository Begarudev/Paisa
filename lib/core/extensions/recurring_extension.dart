// 📦 Package imports:
import 'package:hive_flutter/adapters.dart';

// 🌎 Project imports:
import 'package:paisa/features/recurring/data/model/recurring.dart';
import 'package:paisa/features/transaction/data/model/transaction_model.dart';

extension RecurringModelBoxHelper on Box<RecurringModel> {}

extension RecurringModelHelper on RecurringModel {
  TransactionModel toExpenseModel(DateTime time) {
    return TransactionModel(
      name: name,
      currency: amount,
      time: time,
      type: transactionType,
      accountId: accountId,
      categoryId: categoryId,
    );
  }
}
