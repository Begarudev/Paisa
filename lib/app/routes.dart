import 'package:flutter/material.dart';
import 'package:flutter_paisa/common/constants/constants.dart';
import 'package:flutter_paisa/data/goals/model/goal.dart';
import 'package:flutter_paisa/presentation/goal/page/goals_details_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

import '../common/enum/box_types.dart';
import '../data/accounts/model/account.dart';
import '../data/category/model/category.dart';
import '../data/expense/model/expense.dart';
import '../data/settings/settings_service.dart';
import '../main.dart';
import '../presentation/accounts/pages/add_account_page.dart';
import '../presentation/category/pages/add_category_page.dart';
import '../presentation/expense/pages/expense_page.dart';
import '../presentation/home/pages/home_page.dart';
import '../presentation/login/pages/user_image_page.dart';
import '../presentation/login/pages/user_name_page.dart';
import '../presentation/splash/pages/splash_screen_page.dart';

const splashPath = '/splash';
const userNamePath = '/user-name';
const userImagePath = '/user-image';
const landingPath = '/landing';
const loginPath = '/login';
const addExpensePath = 'add-expense';
const addCategoryPath = 'add-category';
const addAccountPath = 'add-account';
const goalDetailsPath = 'goal-details';

final settings = Hive.box(BoxType.settings.stringValue);

final GoRouter goRouter = GoRouter(
  initialLocation: loginPath,
  errorBuilder: (context, state) => Center(
    child: Text(state.error.toString()),
  ),
  urlPathStrategy: UrlPathStrategy.path,
  redirect: (state) {
    final isLogging = state.location == loginPath;
    final String name = settings.get(userNameKey, defaultValue: '');
    if (name.isEmpty && isLogging) {
      return userNamePath;
    }
    final String image = settings.get(userImageKey, defaultValue: '');
    if (image.isEmpty && isLogging) {
      return userImagePath;
    }
    final languageCode = settings.get(userLanguageKey, defaultValue: 'DEF');
    if (languageCode == 'DEF' && isLogging) {
      return splashPath;
    }
    if (name.isNotEmpty && image.isNotEmpty && isLogging) {
      currentLocale = languageCode;
      return landingPath;
    }
    return null;
  },
  refreshListenable: settings.listenable(),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: 'login',
      path: loginPath,
      builder: (context, state) =>
          const Center(child: CircularProgressIndicator()),
    ),
    GoRoute(
      name: 'splash',
      path: splashPath,
      builder: (context, state) {
        if (state.extra is Map) {
          final map = state.extra as Map;
          return SplashScreenPage(
            forceChangeCurrency: map['force_change_currency'] as bool,
          );
        } else {
          return const SplashScreenPage();
        }
      },
    ),
    GoRoute(
      name: 'landing',
      path: landingPath,
      builder: (context, state) => const LandingPage(),
      routes: [
        GoRoute(
          name: 'add-expense',
          path: addExpensePath,
          builder: (context, state) {
            if (state.queryParams[addGoalExpense] == 'true') {
              return ExpensePage(
                expense: state.extra as Expense?,
                isGoalExpense: true,
                goalId: int.parse(state.queryParams[goalId] as String),
              );
            } else {
              return ExpensePage(
                expense: state.extra as Expense?,
              );
            }
          },
        ),
        GoRoute(
          name: 'add-category',
          path: addCategoryPath,
          builder: (context, state) => AddCategoryPage(
            category: state.extra as Category?,
          ),
        ),
        GoRoute(
          path: 'add-account',
          name: addAccountPath,
          builder: (context, state) => AddAccountPage(
            account: state.extra as Account?,
          ),
        ),
        GoRoute(
          path: 'goal-details',
          name: goalDetailsPath,
          builder: (context, state) => GoalsDetailsPage(
            goal: state.extra as Goal,
          ),
        ),
      ],
    ),
    GoRoute(
      name: 'user-name',
      path: userNamePath,
      builder: (context, state) => UserNamePage(),
    ),
    GoRoute(
      name: 'user-image',
      path: userImagePath,
      builder: (context, state) => const UserImagePage(),
    ),
  ],
);
