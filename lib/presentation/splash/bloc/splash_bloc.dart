import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paisa/data/goals/model/goal.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../common/enum/box_types.dart';
import '../../../common/enum/card_type.dart';
import '../../../data/accounts/model/account.dart';
import '../../../data/category/model/category.dart';
import '../../../data/settings/settings_service.dart';
import '../../../di/service_locator.dart';
import '../../../main.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {});
    on<CheckLoginEvent>(_checkLogin);
  }
  final service = locator.get<SettingsService>();
  late final settings = Hive.box(BoxType.settings.stringValue);
  late final accounts = Hive.box<Account>(BoxType.accounts.stringValue);
  late final categorys = Hive.box<Category>(BoxType.category.stringValue);
  late final goals = Hive.box<Goal>(BoxType.goals.stringValue);

  FutureOr<void> _checkLogin(
    CheckLoginEvent event,
    Emitter<SplashState> emit,
  ) async {
    final isAnyAccount = accounts.values.isEmpty;
    if (isAnyAccount) {
      final account = Account(
        name: 'Holder name',
        icon: Icons.credit_card.codePoint,
        bankName: 'Bank name',
        validThru: DateTime.now(),
        number: '1234',
        cardType: CardType.cash,
      );
      final int id = await accounts.add(account);
      account.superId = id;
      await account.save();
    }

    final isAnyCategory = categorys.values.isEmpty;
    if (isAnyCategory) {
      final category = Category(
        name: 'Default',
        icon: MdiIcons.home.codePoint,
        description: 'All expenses',
      );
      final int id = await categorys.add(category);
      category.superId = id;
      category.save();
    }

    final isAnyGoals = goals.values.isEmpty;
    if (isAnyGoals) {
      final goal = Goal(
        amount: 1000,
        description: 'Demo Goal',
        endTime: DateTime.now().add(const Duration(days: 30)),
        title: 'Save money',
      );
      final int id = await goals.add(goal);
      goal.superId = id;
      goal.save();
    }

    final languageCode = settings.get(userLanguageKey, defaultValue: 'DEF');
    //emit(CountryLocalesState(locales));

    if (languageCode == 'DEF' || event.forceChangeCurrency) {
      emit(const CountryLocalesState(locales));
    } else {
      currentLocale = languageCode;
      emit(NavigateToHome());
    }
  }

  Future<void> setSelectedLocale(Locale locale) async {
    await settings.put(userLanguageKey, locale.languageCode);
    add(const CheckLoginEvent());
  }
}

const Map<String, Locale> locales = {
  "US Doller": Locale('en'),
  "Indian Rupee": Locale('hi'),
  "Malaysia Ringgit": Locale('ms'),
  "Ukrainian Hryvnia": Locale('uk'),
  "Polish Złoty": Locale('pl'),
  "Austria Euro": Locale('de'),
  "Bangladesh Taka": Locale('bn'),
  "Turkish lira": Locale('tr'),
  "Mexican peso": Locale('es-mx'),
  "Philippine peso": Locale('fil'),
  "Indonesian rupiah": Locale('id'),
  "Vietnamese dong": Locale('vi'),
  "Lebanese pound": Locale('ar-lb'),
};
