import 'package:daily_agenda/widgets/category_filter_bar.dart';
import 'package:daily_agenda/widgets/daily_agenda_title_widget.dart';
import 'package:daily_agenda/widgets/events_list_widget.dart';
import 'package:daily_agenda/widgets/parent_child_card.dart';
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
                const ParentChildCard(),
                SizedBox(height: 24),
                DailyAgendaTitleWidget(),
                SizedBox(height: 16),
                const CategoryFilterBar(),
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