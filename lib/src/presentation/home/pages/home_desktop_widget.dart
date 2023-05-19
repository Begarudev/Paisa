import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../core/enum/box_types.dart';
import '../../settings/widgets/user_profile_widget.dart';
import '../../summary/widgets/welcome_name_widget.dart';
import '../../widgets/color_palette.dart';
import '../../widgets/filter_widget/paisa_filter_transaction_widget.dart';
import '../../widgets/paisa_icon_title.dart';
import '../../widgets/paisa_search_bar.dart';
import '../bloc/home_bloc.dart';
import '../widgets/content_widget.dart';
import '../widgets/desktop_drawer_item_widget.dart';
import '../widgets/welcome_widget.dart';

class HomeDesktopWidget extends StatelessWidget {
  const HomeDesktopWidget({
    super.key,
    required this.homeBloc,
    required this.floatingActionButton,
  });

  final Widget floatingActionButton;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          BlocBuilder(
            bloc: homeBloc,
            builder: (context, state) {
              return NavigationRail(
                indicatorShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                extended: true,
                leading: const PaisaIcon(),
                trailing: IconButton(
                  onPressed: () {
                    GoRouter.of(context).goNamed(settingsPath);
                  },
                  icon: const Icon(MdiIcons.cog),
                ),
                destinations: [
                  NavigationRailDestination(
                    label: Text(context.loc.home),
                    icon: const Icon(Icons.home_outlined),
                    selectedIcon: const Icon(Icons.home),
                  ),
                  NavigationRailDestination(
                    label: Text(context.loc.accounts),
                    icon: const Icon(Icons.credit_card_outlined),
                    selectedIcon: const Icon(Icons.credit_card),
                  ),
                  NavigationRailDestination(
                    label: Text(context.loc.debts),
                    icon: const Icon(MdiIcons.accountCash),
                    selectedIcon: const Icon(MdiIcons.accountCashOutline),
                  ),
                  NavigationRailDestination(
                    label: Text(context.loc.overview),
                    icon: const Icon(MdiIcons.sortVariant),
                    selectedIcon: const Icon(MdiIcons.sortVariant),
                  ),
                  NavigationRailDestination(
                    label: Text(context.loc.categories),
                    icon: const Icon(Icons.category_outlined),
                    selectedIcon: const Icon(Icons.category),
                  ),
                  NavigationRailDestination(
                    label: Text(context.loc.budget),
                    icon: const Icon(MdiIcons.timetable),
                    selectedIcon: const Icon(MdiIcons.timetable),
                  ),
                ],
                selectedIndex: homeBloc.getIndexFromPage(homeBloc.currentPage),
                onDestinationSelected: (index) => homeBloc
                    .add(CurrentIndexEvent(homeBloc.getPageFromIndex(index))),
              );
            },
          ),
          Expanded(child: ContentWidget())
        ],
      ),
    );
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 100,
            child: BlocBuilder(
              bloc: homeBloc,
              builder: (context, state) {
                if (state is CurrentIndexState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScreenTypeLayout(
                        mobile: const SizedBox(height: kToolbarHeight),
                        tablet: const SizedBox(height: 32),
                        desktop: const SizedBox(height: kToolbarHeight),
                      ),
                      /* ListTile(
                        leading: Icon(
                          Icons.wallet,
                          size: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.fontSize,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          context.loc.appTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ), */
                      const SizedBox(height: 24),
                      NavigationBarItem(
                        title: context.loc.home,
                        icon: MdiIcons.home,
                        isSelected: state.currentPage == PageType.home,
                        onPressed: () => homeBloc
                            .add(const CurrentIndexEvent(PageType.home)),
                      ),
                      NavigationBarItem(
                        title: context.loc.accounts,
                        icon: MdiIcons.creditCard,
                        isSelected: state.currentPage == PageType.accounts,
                        onPressed: () => homeBloc
                            .add(const CurrentIndexEvent(PageType.accounts)),
                      ),
                      NavigationBarItem(
                        title: context.loc.categories,
                        icon: Icons.category,
                        isSelected: state.currentPage == PageType.category,
                        onPressed: () => homeBloc
                            .add(const CurrentIndexEvent(PageType.category)),
                      ),
                      NavigationBarItem(
                        title: context.loc.overview,
                        icon: MdiIcons.sortVariant,
                        isSelected: state.currentPage == PageType.overview,
                        onPressed: () => homeBloc
                            .add(const CurrentIndexEvent(PageType.overview)),
                      ),
                      NavigationBarItem(
                        title: context.loc.debts,
                        icon: MdiIcons.accountCash,
                        isSelected: state.currentPage == PageType.debts,
                        onPressed: () => homeBloc
                            .add(const CurrentIndexEvent(PageType.debts)),
                      ),
                      NavigationBarItem(
                        title: context.loc.budget,
                        icon: MdiIcons.timetable,
                        isSelected: state.currentPage == PageType.budget,
                        onPressed: () => homeBloc
                            .add(const CurrentIndexEvent(PageType.budget)),
                      ),
                      const Divider(),
                      NavigationBarItem(
                        title: context.loc.settings,
                        icon: MdiIcons.cog,
                        isSelected: false,
                        onPressed: () =>
                            GoRouter.of(context).pushNamed(settingsPath),
                      )
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Expanded(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => showModalBottomSheet(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width >= 700
                                ? 700
                                : double.infinity,
                          ),
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          context: context,
                          builder: (_) => UserProfilePage(
                            settings: getIt.get<Box<dynamic>>(
                              instanceName: BoxType.settings.name,
                            ),
                            controller: TextEditingController(),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ColorPalette(),
                                  ),
                                );
                              },
                              child: const UserImageWidget(),
                            ),
                            const WelcomeNameWidget(),
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          PaisaFilterTransactionWidget(),
                          PaisaSearchBar(),
                          SizedBox(width: 24),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ContentWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: Row(
        children: [
          BlocBuilder(
            bloc: homeBloc,
            builder: (context, state) {
              if (state is CurrentIndexState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenTypeLayout(
                      mobile: const SizedBox(height: kToolbarHeight),
                      tablet: const SizedBox(height: 32),
                      desktop: const SizedBox(height: kToolbarHeight),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.wallet,
                        size: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.fontSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text(
                        context.loc.appTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    NavigationBarItem(
                      title: context.loc.home,
                      icon: MdiIcons.home,
                      isSelected: state.currentPage == PageType.home,
                      onPressed: () =>
                          homeBloc.add(const CurrentIndexEvent(PageType.home)),
                    ),
                    NavigationBarItem(
                      title: context.loc.accounts,
                      icon: MdiIcons.creditCard,
                      isSelected: state.currentPage == PageType.accounts,
                      onPressed: () => homeBloc
                          .add(const CurrentIndexEvent(PageType.accounts)),
                    ),
                    NavigationBarItem(
                      title: context.loc.categories,
                      icon: Icons.category,
                      isSelected: state.currentPage == PageType.category,
                      onPressed: () => homeBloc
                          .add(const CurrentIndexEvent(PageType.category)),
                    ),
                    NavigationBarItem(
                      title: context.loc.overview,
                      icon: MdiIcons.sortVariant,
                      isSelected: state.currentPage == PageType.overview,
                      onPressed: () => homeBloc
                          .add(const CurrentIndexEvent(PageType.overview)),
                    ),
                    NavigationBarItem(
                      title: context.loc.debts,
                      icon: MdiIcons.accountCash,
                      isSelected: state.currentPage == PageType.debts,
                      onPressed: () =>
                          homeBloc.add(const CurrentIndexEvent(PageType.debts)),
                    ),
                    NavigationBarItem(
                      title: context.loc.budget,
                      icon: MdiIcons.timetable,
                      isSelected: state.currentPage == PageType.budget,
                      onPressed: () => homeBloc
                          .add(const CurrentIndexEvent(PageType.budget)),
                    ),
                    const Divider(),
                    NavigationBarItem(
                      title: context.loc.settings,
                      icon: MdiIcons.cog,
                      isSelected: false,
                      onPressed: () =>
                          GoRouter.of(context).pushNamed(settingsPath),
                    )
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const VerticalDivider(width: 0),
          Expanded(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => showModalBottomSheet(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width >= 700
                                ? 700
                                : double.infinity,
                          ),
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          context: context,
                          builder: (_) => UserProfilePage(
                            settings: getIt.get<Box<dynamic>>(
                              instanceName: BoxType.settings.name,
                            ),
                            controller: TextEditingController(),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ColorPalette(),
                                  ),
                                );
                              },
                              child: const UserImageWidget(),
                            ),
                            const WelcomeNameWidget(),
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          PaisaFilterTransactionWidget(),
                          PaisaSearchBar(),
                          SizedBox(width: 24),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ContentWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
