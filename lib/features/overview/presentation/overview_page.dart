// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_empty_widget.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/overview/presentation/widgets/filter_tabs_widget.dart';

// Project imports:
import 'package:paisa/features/overview/presentation/widgets/overview_bar_chart.dart';
import 'package:paisa/features/overview/presentation/widgets/overview_pie_chart_widget.dart';
import 'package:paisa/features/overview/presentation/widgets/overview_transaction_widget.dart';
import 'package:paisa/main.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SummaryController controller = getIt<SummaryController>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: OverviewTransactionWidget(
              builder: (transactions) {
                if (transactions.isEmpty) {
                  return EmptyWidget(
                    icon: Icons.paid,
                    title: context.loc.emptyOverviewMessageTitle,
                    description: context.loc.emptyOverviewMessageSubtitle,
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 124),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: FilterTabs(
                        valueNotifier:
                            getIt<SummaryController>().filterExpenseNotifier,
                      ),
                    ),
                    FilterGroupCategoryTransactionWidget(
                      transactions: transactions,
                      valueNotifier: controller.filterExpenseNotifier,
                      builder: (groupedTransactions) {
                        return OverViewBarChartWidget(
                          groupedTransactions: groupedTransactions,
                        );
                      },
                    ),
                    const CategoryTransactionFilterWidget(),
                    FilterTransactionTypeWidget(
                      valueNotifier: controller.typeNotifier,
                      transactions: transactions,
                      builder: (transactions) {
                        return FilterGroupCategoryTransactionWidget(
                          transactions: transactions,
                          valueNotifier: controller.filterExpenseNotifier,
                          builder: (groupedTransactions) {
                            if (groupedTransactions.isNotEmpty) {
                              controller.dateNotifier.value =
                                  groupedTransactions.keys.first;
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 6,
                                  ),
                                  child: FilterSecondaryTabsWidget(
                                    dates: groupedTransactions.keys.toList(),
                                    valueNotifier: controller.dateNotifier,
                                  ),
                                ),
                                ValueListenableBuilder<String>(
                                  valueListenable: controller.dateNotifier,
                                  builder: (_, value, child) {
                                    return OverviewPieChartWidget(
                                      transactions:
                                          groupedTransactions[value] ?? [],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
