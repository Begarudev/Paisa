import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../main.dart';
import '../../../core/common.dart';
import '../../../core/enum/box_types.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int navigationDrawerIndex = 0;

  HomeBloc() : super(const CurrentIndexState(PageType.home)) {
    on<HomeEvent>((event, emit) {});
    on<CurrentIndexEvent>(_currentIndex);
  }

  final Box<dynamic> settings =
      getIt.get<Box<dynamic>>(instanceName: BoxType.settings.name);

  PageType currentPage = PageType.home;

  void _currentIndex(
    CurrentIndexEvent event,
    Emitter<HomeState> emit,
  ) {
    if (currentPage != event.currentPage) {
      currentPage = event.currentPage;
      emit(CurrentIndexState(event.currentPage));
    }
  }

  int getIndexFromPage(PageType currentPage) {
    switch (currentPage) {
      case PageType.accounts:
        return 1;
      case PageType.debts:
        return 2;
      case PageType.overview:
        return 3;
      case PageType.home:
        return 0;
      case PageType.category:
        return 4;
      case PageType.budget:
        return 5;
    }
  }

  PageType getPageFromIndex(int index) {
    switch (index) {
      case 1:
        return PageType.accounts;
      case 2:
        return PageType.debts;
      case 3:
        return PageType.overview;
      case 4:
        return PageType.category;
      case 5:
        return PageType.budget;
      case 0:
      default:
        return PageType.home;
    }
  }
}
