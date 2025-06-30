import 'package:daily_agenda/widgets/category_selector_widget.dart';
import 'package:daily_agenda/widgets/child_dropdown_widget.dart';
import 'package:daily_agenda/widgets/daily_agenda_title_widget.dart';
import 'package:daily_agenda/widgets/events_list_widget.dart';
import 'package:daily_agenda/widgets/parent_info_widget.dart';
import 'package:flutter/material.dart';

class AgendaWideLayout extends StatelessWidget {
  final List<String> categories;

  const AgendaWideLayout({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParentInfoWidget(),
                SizedBox(height: 12),
                ChildDropdownWidget(),
                SizedBox(height: 20),
                DailyAgendaTitleWidget(),
                SizedBox(height: 12),
                CategorySelectorWidget(categories: categories),
              ],
            ),
          ),
          SizedBox(width: 24),
          Expanded(child: EventsListWidget()),
        ],
      ),
    );
  }
}