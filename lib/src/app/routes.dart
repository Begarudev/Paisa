import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

import '../../main.dart';
import '../core/common.dart';
import '../core/enum/box_types.dart';
import '../core/enum/transaction_type.dart';
import '../data/settings/authenticate.dart';
import '../presentation/accounts/pages/add/add_account_page.dart';
import '../presentation/category/pages/add/add_category_page.dart';
import '../presentation/category/pages/category_list_page.dart';
import '../presentation/currency_selector/pages/currency_selector_page.dart';
import '../presentation/debits/pages/add/add_debt_page.dart';
import '../presentation/expense/pages/expense_page.dart';
import '../presentation/home/pages/home_page.dart';
import '../presentation/login/intro/into_page.dart';
import '../presentation/login/pages/user_image_page.dart';
import '../presentation/login/pages/user_name_page.dart';
import '../presentation/overview/pages/expense_list_page.dart';
import '../presentation/recurring/page/add_recurring_page.dart';
import '../presentation/recurring/page/recurring_page.dart';
import '../presentation/search/pages/search_page.dart';
import '../presentation/settings/pages/export_and_import_page.dart';
import '../presentation/settings/pages/setting_page.dart';

const loginPath = '/login';
const loginName = 'login';

const splashPath = '/splash';
const splashName = 'splash';

const userNamePath = '/user-name';
const userName = 'user-name';

const userImagePath = '/user-image';
const userImageName = 'user-image';

const landingPath = '/landing';
const landingName = 'landing';

const searchPath = 'search';
const searchName = 'search';

const shortcutAddTransactionPath = 'short-cut-add-expense/:type';
const shortcutAddTransactionName = 'short-cut-add-expense';

const addTransactionPath = 'add-transaction';
const addTransactionsName = 'add-transaction';

const editTransactionsName = 'edit-transaction';
const editTransactionsPath = 'edit-transaction/:eid';

const addCategoryPath = 'add-category';
const addCategoryName = 'add-category';

const manageCategoriesPath = 'categories';
const manageCategoriesName = 'categories';

const editCategoryPath = 'edit-category/:cid';
const editCategoryName = 'edit-category';

const addAccountPath = 'add-account';
const addAccountName = 'add-account';

const editAccountPath = 'edit-account/:aid';
const editAccountName = 'edit-account';

const expensesByCategoryName = 'expenses-by-category';
const expensesByCategoryPath = 'expenses-by-category/:cid';

const exportAndImportName = 'import-export';
const exportAndImportPath = 'import-export';

const recurringTransactionsName = 'recurring';
const recurringTransactionsPath = 'recurring';

const recurringName = 'add-recurring';
const recurringPath = 'add-recurring';

const settingsPath = 'settings';
const settingsName = 'settings';

const debtAddOrEditName = 'edit-debt';
const debtAddOrEditPath = 'edit-debt/:did';

const addDebitName = 'add-debit';
const addDebitPath = 'add-debit';

const introPageName = 'intro';
const introPagePath = '/intro';

final settings = Hive.box(BoxType.settings.name);

final GoRouter goRouter = GoRouter(
  initialLocation: introPagePath,
  observers: [HeroController()],
  refreshListenable: settings.listenable(),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: introPageName,
      path: introPagePath,
      builder: (context, state) => const IntroPage(),
    ),
    GoRoute(
      name: loginName,
      path: loginPath,
      builder: (context, state) =>
          const Center(child: CircularProgressIndicator()),
    ),
    GoRoute(
      name: splashName,
      path: splashPath,
      builder: (context, state) {
        if (state.extra is Map) {
          final map = state.extra as Map;
          return CurrencySelectorPage(
            forceChangeCurrency: map['force_change_currency'] as bool,
          );
        } else {
          return CurrencySelectorPage();
        }
      },
    ),
    GoRoute(
      name: userName,
      path: userNamePath,
      builder: (context, state) => UserNamePage(),
    ),
    GoRoute(
      name: userImageName,
      path: userImagePath,
      builder: (context, state) => const UserImagePage(),
    ),
    GoRoute(
      name: landingName,
      path: landingPath,
      builder: (context, state) => const LandingPage(),
      routes: [
        GoRoute(
          path: shortcutAddTransactionPath,
          name: shortcutAddTransactionName,
          pageBuilder: (context, state) {
            String? transactionTypeString = state.params['type'];
            int transactionType =
                int.tryParse(transactionTypeString ?? '') ?? 0;
            return MaterialPage(
              key: ValueKey(
                state.location +
                    DateTime.now().millisecondsSinceEpoch.toString(),
              ),
              child: ExpensePage(
                transactionType: TransactionType.values[transactionType],
              ),
            );
          },
        ),
        GoRoute(
          path: addTransactionPath,
          name: addTransactionsName,
          pageBuilder: (context, state) => MaterialPage(
            key: ValueKey(
              state.location + DateTime.now().millisecondsSinceEpoch.toString(),
            ),
            child: const ExpensePage(),
          ),
        ),
        GoRoute(
          name: editTransactionsName,
          path: editTransactionsPath,
          pageBuilder: (context, state) => MaterialPage(
            key: ValueKey(
              state.location + DateTime.now().millisecondsSinceEpoch.toString(),
            ),
            child: ExpensePage(
              expenseId: state.params['eid'],
            ),
          ),
        ),
        GoRoute(
          name: addCategoryName,
          path: addCategoryPath,
          builder: (context, state) => const AddCategoryPage(),
        ),
        GoRoute(
          name: editCategoryName,
          path: editCategoryPath,
          builder: (context, state) => AddCategoryPage(
            categoryId: state.params['cid'],
          ),
        ),
        GoRoute(
          name: manageCategoriesName,
          path: manageCategoriesPath,
          builder: (context, state) => const CategoryListPage(),
        ),
        GoRoute(
          name: addAccountName,
          path: addAccountPath,
          builder: (context, state) => const AddAccountPage(),
        ),
        GoRoute(
          name: editAccountName,
          path: editAccountPath,
          builder: (context, state) => AddAccountPage(
            accountId: state.params['aid'],
          ),
        ),
        GoRoute(
          name: expensesByCategoryName,
          path: expensesByCategoryPath,
          builder: (context, state) => ExpenseListPage(
            categoryId: state.params['cid'] as String,
            accountLocalDataSource: getIt.get(),
            categoryLocalDataSource: getIt.get(),
            expenseDataManager: getIt.get(),
          ),
        ),
        GoRoute(
          name: addDebitName,
          path: addDebitPath,
          builder: (context, state) => const AddOrEditDebtPage(),
        ),
        GoRoute(
          name: debtAddOrEditName,
          path: debtAddOrEditPath,
          builder: (context, state) => AddOrEditDebtPage(
            debtId: state.params['did'],
          ),
        ),
        GoRoute(
          name: searchName,
          path: searchPath,
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          name: recurringTransactionsName,
          path: recurringTransactionsPath,
          builder: (context, state) => const RecurringPage(),
          routes: [
            GoRoute(
              name: recurringName,
              path: recurringPath,
              builder: (context, state) => const AddRecurringPage(),
            ),
          ],
        ),
        GoRoute(
          name: settingsName,
          path: settingsPath,
          builder: (context, state) => const SettingsPage(),
          routes: [
            GoRoute(
              name: exportAndImportName,
              path: exportAndImportPath,
              builder: (context, state) => const ExportAndImportPage(),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Center(
    child: Text(state.error.toString()),
  ),
  redirect: (_, state) async {
    final isLogging = state.location == introPagePath;
    bool isIntroDone = settings.get(userIntroKey, defaultValue: false);
    if (!isIntroDone) {
      return introPagePath;
    }
    final String name = settings.get(userNameKey, defaultValue: '');
    if (name.isEmpty && isLogging) {
      return userNamePath;
    }
    final String image = settings.get(userImageKey, defaultValue: '');
    if (image.isEmpty && isLogging) {
      return userImagePath;
    }
    final String languageCode =
        settings.get(userLanguageKey, defaultValue: 'DEF');
    if (languageCode == 'DEF' && isLogging) {
      return splashPath;
    }
    final isBiometricEnabled = settings.get(userAuthKey, defaultValue: false);
    if (isBiometricEnabled &&
        name.isNotEmpty &&
        image.isNotEmpty &&
        isLogging) {
      final localAuth = getIt.get<Authenticate>();

      final bool canCheckBiometrics = await localAuth.canCheckBiometrics();

      if (canCheckBiometrics) {
        final bool result = await localAuth.authenticateWithBiometrics();
        if (result) {
          return landingPath;
        } else {
          SystemNavigator.pop();
        }
      }
    } else if (name.isNotEmpty && image.isNotEmpty && isLogging) {
      return landingPath;
    }
    return null;
  },
);
