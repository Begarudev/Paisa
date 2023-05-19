// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/adapters.dart' as _i4;
import 'package:hive_flutter/hive_flutter.dart' as _i32;
import 'package:injectable/injectable.dart' as _i2;

import '../data/accounts/data_sources/local_account_data_manager.dart' as _i26;
import '../data/accounts/data_sources/local_account_data_manager_impl.dart'
    as _i27;
import '../data/accounts/model/account_model.dart' as _i9;
import '../data/accounts/repository/account_repository_impl.dart' as _i41;
import '../data/category/data_sources/category_local_data_source.dart' as _i28;
import '../data/category/data_sources/category_local_data_source_impl.dart'
    as _i29;
import '../data/category/model/category_model.dart' as _i10;
import '../data/category/repository/category_repository_impl.dart' as _i47;
import '../data/currencies/repository/currencies_repository_impl.dart' as _i12;
import '../data/debt/data_sources/debt_local_data_source.dart' as _i13;
import '../data/debt/data_sources/debt_local_data_source_impl.dart' as _i14;
import '../data/debt/models/debt_model.dart' as _i5;
import '../data/debt/models/transactions_model.dart' as _i6;
import '../data/debt/repository/debt_repository_impl.dart' as _i16;
import '../data/expense/data_sources/local_expense_data_manager.dart' as _i30;
import '../data/expense/data_sources/local_expense_data_manager_impl.dart'
    as _i31;
import '../data/expense/model/expense_model.dart' as _i8;
import '../data/expense/repository/expense_repository_impl.dart' as _i54;
import '../data/recurring/data_sources/local_recurring_data_manager.dart'
    as _i33;
import '../data/recurring/data_sources/local_recurring_data_manager_impl.dart'
    as _i34;
import '../data/recurring/model/recurring.dart' as _i7;
import '../data/recurring/repository/recurring_repository_impl.dart' as _i36;
import '../data/settings/authenticate.dart' as _i3;
import '../data/settings/file_handler.dart' as _i20;
import '../data/settings/settings.dart' as _i37;
import '../domain/account/repository/account_repository.dart' as _i40;
import '../domain/account/use_case/account_use_case.dart' as _i68;
import '../domain/account/use_case/add_account_use_case.dart' as _i42;
import '../domain/account/use_case/delete_account_use_case.dart' as _i51;
import '../domain/account/use_case/get_account_use_case.dart' as _i56;
import '../domain/account/use_case/get_accounts_use_case.dart' as _i57;
import '../domain/account/use_case/update_account_use_case.dart' as _i71;
import '../domain/category/repository/category_repository.dart' as _i46;
import '../domain/category/use_case/add_category_use_case.dart' as _i74;
import '../domain/category/use_case/category_use_case.dart' as _i69;
import '../domain/category/use_case/delete_category_use_case.dart' as _i52;
import '../domain/category/use_case/get_category_use_case.dart' as _i58;
import '../domain/category/use_case/update_category_use_case.dart' as _i72;
import '../domain/currencies/repository/currencies_repository.dart' as _i11;
import '../domain/currencies/use_case/get_country_user_case.dart' as _i21;
import '../domain/currencies/use_case/get_currencies_use_case.dart' as _i22;
import '../domain/debt/repository/debit_repository.dart' as _i15;
import '../domain/debt/use_case/add_debt_use.case.dart' as _i43;
import '../domain/debt/use_case/add_transaction_use_case.dart' as _i45;
import '../domain/debt/use_case/debt_use_case.dart' as _i50;
import '../domain/debt/use_case/delete_debt_use_case.dart' as _i17;
import '../domain/debt/use_case/delete_transaction_use_case.dart' as _i18;
import '../domain/debt/use_case/delete_transactions_use_case.dart' as _i19;
import '../domain/debt/use_case/get_debt_use_case.dart' as _i23;
import '../domain/debt/use_case/get_transactions_use_case.dart' as _i24;
import '../domain/debt/use_case/update_debt_use.case.dart' as _i39;
import '../domain/expense/repository/expense_repository.dart' as _i53;
import '../domain/expense/use_case/add_expenses_use_case.dart' as _i75;
import '../domain/expense/use_case/delete_expense_use_case.dart' as _i77;
import '../domain/expense/use_case/delete_expenses_from_account_id.dart'
    as _i78;
import '../domain/expense/use_case/delete_expenses_from_category_id.dart'
    as _i79;
import '../domain/expense/use_case/expense_use_case.dart' as _i66;
import '../domain/expense/use_case/filter_expense_use_case.dart' as _i55;
import '../domain/expense/use_case/get_expense_from_account_id.dart' as _i60;
import '../domain/expense/use_case/get_expense_from_category_id.dart' as _i61;
import '../domain/expense/use_case/get_expense_use_case.dart' as _i59;
import '../domain/expense/use_case/get_expenses_use_case.dart' as _i62;
import '../domain/expense/use_case/update_expense_use_case.dart' as _i73;
import '../domain/recurring/repository/recurring_repository.dart' as _i35;
import '../domain/recurring/use_case/add_recurring_use_case.dart' as _i44;
import '../domain/recurring/use_case/recurring_use_case.dart' as _i64;
import '../presentation/accounts/bloc/accounts_bloc.dart' as _i81;
import '../presentation/category/bloc/category_bloc.dart' as _i82;
import '../presentation/currency_selector/bloc/currency_selector_bloc.dart'
    as _i48;
import '../presentation/debits/cubit/debts_bloc.dart' as _i49;
import '../presentation/expense/bloc/expense_bloc.dart' as _i80;
import '../presentation/home/bloc/home_bloc.dart' as _i25;
import '../presentation/overview/cubit/budget_cubit.dart' as _i76;
import '../presentation/recurring/cubit/recurring_cubit.dart' as _i63;
import '../presentation/search/cubit/search_cubit.dart' as _i65;
import '../presentation/settings/bloc/settings_controller.dart' as _i38;
import '../presentation/summary/controller/summary_controller.dart' as _i67;
import '../presentation/summary/cubit/summary_cubit.dart' as _i70;
import 'module/hive_module.dart' as _i83;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final hiveBoxModule = _$HiveBoxModule();
  gh.singleton<_i3.Authenticate>(_i3.Authenticate());
  await gh.singletonAsync<_i4.Box<_i5.DebtModel>>(
    () => hiveBoxModule.debtsBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i6.TransactionsModel>>(
    () => hiveBoxModule.transactionsBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i7.RecurringModel>>(
    () => hiveBoxModule.recurringBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<dynamic>>(
    () => hiveBoxModule.boxDynamic,
    instanceName: 'settings',
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Box<_i8.ExpenseModel>>(
    () => hiveBoxModule.expenseBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i9.AccountModel>>(
    () => hiveBoxModule.accountBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i4.Box<_i10.CategoryModel>>(
    () => hiveBoxModule.categoryBox,
    preResolve: true,
  );
  gh.singleton<_i11.CurrenciesRepository>(
      _i12.CurrencySelectorRepositoryImpl());
  gh.singleton<_i13.DebtLocalDataSource>(_i14.DebtLocalDataSourceImpl(
    debtBox: gh<_i4.Box<_i5.DebtModel>>(),
    transactionsBox: gh<_i4.Box<_i6.TransactionsModel>>(),
  ));
  gh.singleton<_i15.DebtRepository>(
      _i16.DebtRepositoryImpl(dataSource: gh<_i13.DebtLocalDataSource>()));
  gh.singleton<_i17.DeleteDebtUseCase>(
      _i17.DeleteDebtUseCase(debtRepository: gh<_i15.DebtRepository>()));
  gh.singleton<_i18.DeleteTransactionUseCase>(
      _i18.DeleteTransactionUseCase(debtRepository: gh<_i15.DebtRepository>()));
  gh.singleton<_i19.DeleteTransactionsUseCase>(_i19.DeleteTransactionsUseCase(
      debtRepository: gh<_i15.DebtRepository>()));
  gh.singleton<_i20.FileHandler>(_i20.FileHandler());
  gh.factory<_i21.GetCurrenciesUseCase>(() =>
      _i21.GetCurrenciesUseCase(repository: gh<_i11.CurrenciesRepository>()));
  gh.factory<_i22.GetCurrenciesUseCase>(() =>
      _i22.GetCurrenciesUseCase(repository: gh<_i11.CurrenciesRepository>()));
  gh.singleton<_i23.GetDebtUseCase>(
      _i23.GetDebtUseCase(debtRepository: gh<_i15.DebtRepository>()));
  gh.singleton<_i24.GetTransactionsUseCase>(
      _i24.GetTransactionsUseCase(debtRepository: gh<_i15.DebtRepository>()));
  gh.factory<_i25.HomeBloc>(() => _i25.HomeBloc());
  gh.singleton<_i26.LocalAccountDataManager>(_i27.LocalAccountDataManagerImpl(
      accountBox: gh<_i4.Box<_i9.AccountModel>>()));
  gh.singleton<_i28.LocalCategoryManagerDataSource>(
      _i29.LocalCategoryManagerDataSourceImpl(
          gh<_i4.Box<_i10.CategoryModel>>()));
  gh.factory<_i30.LocalExpenseDataManager>(
      () => _i31.LocalExpenseDataManagerImpl(gh<_i32.Box<_i8.ExpenseModel>>()));
  gh.factory<_i33.LocalRecurringDataManager>(() =>
      _i34.LocalRecurringDataManagerImpl(gh<_i4.Box<_i7.RecurringModel>>()));
  gh.singleton<_i35.RecurringRepository>(_i36.RecurringRepositoryImpl(
    gh<_i33.LocalRecurringDataManager>(),
    gh<_i30.LocalExpenseDataManager>(),
  ));
  gh.singleton<_i37.Settings>(
      _i37.Settings(gh<_i4.Box<dynamic>>(instanceName: 'settings')));
  gh.singleton<_i38.SettingsController>(
      _i38.SettingsController(gh<_i37.Settings>()));
  gh.singleton<_i39.UpdateDebtUseCase>(
      _i39.UpdateDebtUseCase(debtRepository: gh<_i15.DebtRepository>()));
  gh.singleton<_i40.AccountRepository>(_i41.AccountRepositoryImpl(
      dataSource: gh<_i26.LocalAccountDataManager>()));
  gh.singleton<_i42.AddAccountUseCase>(
      _i42.AddAccountUseCase(accountRepository: gh<_i40.AccountRepository>()));
  gh.singleton<_i43.AddDebtUseCase>(
      _i43.AddDebtUseCase(debtRepository: gh<_i15.DebtRepository>()));
  gh.singleton<_i44.AddRecurringUseCase>(
      _i44.AddRecurringUseCase(gh<_i35.RecurringRepository>()));
  gh.singleton<_i45.AddTransactionUseCase>(
      _i45.AddTransactionUseCase(debtRepository: gh<_i15.DebtRepository>()));
  gh.singleton<_i46.CategoryRepository>(_i47.CategoryRepositoryImpl(
      dataSources: gh<_i28.LocalCategoryManagerDataSource>()));
  gh.factory<_i48.CurrencySelectorBloc>(() => _i48.CurrencySelectorBloc(
        accounts: gh<_i4.Box<_i9.AccountModel>>(),
        categories: gh<_i4.Box<_i10.CategoryModel>>(),
        currenciesUseCase: gh<_i22.GetCurrenciesUseCase>(),
      ));
  gh.factory<_i49.DebtsBloc>(() => _i49.DebtsBloc(
        addDebtUseCase: gh<_i50.AddDebtUseCase>(),
        getDebtUseCase: gh<_i50.GetDebtUseCase>(),
        getTransactionsUseCase: gh<_i50.GetTransactionsUseCase>(),
        addTransactionUseCase: gh<_i50.AddTransactionUseCase>(),
        updateDebtUseCase: gh<_i50.UpdateDebtUseCase>(),
        deleteDebtUseCase: gh<_i50.DeleteDebtUseCase>(),
        deleteTransactionsUseCase: gh<_i50.DeleteTransactionsUseCase>(),
        deleteTransactionUseCase: gh<_i50.DeleteTransactionUseCase>(),
      ));
  gh.singleton<_i51.DeleteAccountUseCase>(_i51.DeleteAccountUseCase(
      accountRepository: gh<_i40.AccountRepository>()));
  gh.singleton<_i52.DeleteCategoryUseCase>(_i52.DeleteCategoryUseCase(
      categoryRepository: gh<_i46.CategoryRepository>()));
  gh.singleton<_i53.ExpenseRepository>(_i54.ExpenseRepositoryImpl(
      dataSource: gh<_i30.LocalExpenseDataManager>()));
  gh.singleton<_i55.FilterExpenseUseCase>(
      _i55.FilterExpenseUseCase(gh<_i53.ExpenseRepository>()));
  gh.singleton<_i56.GetAccountUseCase>(
      _i56.GetAccountUseCase(accountRepository: gh<_i40.AccountRepository>()));
  gh.singleton<_i57.GetAccountsUseCase>(
      _i57.GetAccountsUseCase(accountRepository: gh<_i40.AccountRepository>()));
  gh.singleton<_i58.GetCategoryUseCase>(_i58.GetCategoryUseCase(
      categoryRepository: gh<_i46.CategoryRepository>()));
  gh.singleton<_i59.GetExpenseUseCase>(
      _i59.GetExpenseUseCase(expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.singleton<_i60.GetExpensesFromAccountIdUseCase>(
      _i60.GetExpensesFromAccountIdUseCase(
          expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.singleton<_i61.GetExpensesFromCategoryIdUseCase>(
      _i61.GetExpensesFromCategoryIdUseCase(
          expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.singleton<_i62.GetExpensesUseCase>(
      _i62.GetExpensesUseCase(expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.factory<_i63.RecurringCubit>(
      () => _i63.RecurringCubit(gh<_i64.AddRecurringUseCase>()));
  gh.factory<_i65.SearchCubit>(
      () => _i65.SearchCubit(gh<_i66.FilterExpenseUseCase>()));
  gh.singleton<_i67.SummaryController>(_i67.SummaryController(
    getAccountUseCase: gh<_i68.GetAccountUseCase>(),
    getCategoryUseCase: gh<_i69.GetCategoryUseCase>(),
    getExpensesFromCategoryIdUseCase:
        gh<_i66.GetExpensesFromCategoryIdUseCase>(),
  ));
  gh.factory<_i70.SummaryCubit>(
      () => _i70.SummaryCubit(gh<_i66.GetExpensesUseCase>()));
  gh.singleton<_i71.UpdateAccountUseCase>(_i71.UpdateAccountUseCase(
      accountRepository: gh<_i40.AccountRepository>()));
  gh.singleton<_i72.UpdateCategoryUseCase>(_i72.UpdateCategoryUseCase(
      categoryRepository: gh<_i46.CategoryRepository>()));
  gh.singleton<_i73.UpdateExpensesUseCase>(_i73.UpdateExpensesUseCase(
      expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.singleton<_i74.AddCategoryUseCase>(_i74.AddCategoryUseCase(
      categoryRepository: gh<_i46.CategoryRepository>()));
  gh.singleton<_i75.AddExpenseUseCase>(
      _i75.AddExpenseUseCase(expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.factory<_i76.BudgetCubit>(() => _i76.BudgetCubit(
        gh<_i66.GetExpensesUseCase>(),
        gh<_i67.SummaryController>(),
      ));
  gh.singleton<_i77.DeleteExpenseUseCase>(_i77.DeleteExpenseUseCase(
      expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.singleton<_i78.DeleteExpensesFromAccountIdUseCase>(
      _i78.DeleteExpensesFromAccountIdUseCase(
          expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.singleton<_i79.DeleteExpensesFromCategoryIdUseCase>(
      _i79.DeleteExpensesFromCategoryIdUseCase(
          expenseRepository: gh<_i53.ExpenseRepository>()));
  gh.factory<_i80.ExpenseBloc>(() => _i80.ExpenseBloc(
        gh<_i38.SettingsController>(),
        expenseUseCase: gh<_i66.GetExpenseUseCase>(),
        accountUseCase: gh<_i68.GetAccountUseCase>(),
        addExpenseUseCase: gh<_i66.AddExpenseUseCase>(),
        deleteExpenseUseCase: gh<_i66.DeleteExpenseUseCase>(),
        updateExpensesUseCase: gh<_i73.UpdateExpensesUseCase>(),
        accountsUseCase: gh<_i68.GetAccountsUseCase>(),
      ));
  gh.factory<_i81.AccountsBloc>(() => _i81.AccountsBloc(
        getAccountUseCase: gh<_i68.GetAccountUseCase>(),
        deleteAccountUseCase: gh<_i68.DeleteAccountUseCase>(),
        getExpensesFromAccountIdUseCase:
            gh<_i66.GetExpensesFromAccountIdUseCase>(),
        addAccountUseCase: gh<_i68.AddAccountUseCase>(),
        getAccountsUseCase: gh<_i68.GetAccountsUseCase>(),
        getCategoryUseCase: gh<_i69.GetCategoryUseCase>(),
        deleteExpensesFromAccountIdUseCase:
            gh<_i66.DeleteExpensesFromAccountIdUseCase>(),
        updateAccountUseCase: gh<_i68.UpdateAccountUseCase>(),
      ));
  gh.factory<_i82.CategoryBloc>(() => _i82.CategoryBloc(
        getCategoryUseCase: gh<_i69.GetCategoryUseCase>(),
        addCategoryUseCase: gh<_i69.AddCategoryUseCase>(),
        deleteCategoryUseCase: gh<_i69.DeleteCategoryUseCase>(),
        deleteExpensesFromCategoryIdUseCase:
            gh<_i66.DeleteExpensesFromCategoryIdUseCase>(),
        updateCategoryUseCase: gh<_i69.UpdateCategoryUseCase>(),
      ));
  return getIt;
}

class _$HiveBoxModule extends _i83.HiveBoxModule {}
