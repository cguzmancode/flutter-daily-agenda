import 'package:daily_agenda/widgets/category_selector_widget.dart';
import 'package:daily_agenda/widgets/child_dropdown_widget.dart';
import 'package:daily_agenda/widgets/daily_agenda_title_widget.dart';
import 'package:daily_agenda/widgets/events_list_widget.dart';
import 'package:daily_agenda/widgets/parent_info_widget.dart';
import 'package:flutter/material.dart';

class AgendaMobileLayout extends StatelessWidget {
  final List<String> categories;

  const AgendaMobileLayout({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
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
          SizedBox(height: 16),
          SizedBox(height: 400, child: EventsListWidget()),
        ],
      ),
    );
  }
}