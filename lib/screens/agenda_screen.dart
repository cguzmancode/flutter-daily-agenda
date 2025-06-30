import 'package:daily_agenda/screens/agenda_mobile_layout.dart';
import 'package:daily_agenda/screens/agenda_wide_layout.dart';
import 'package:flutter/material.dart';


class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

  static const List<String> categories = [
    'Feeding',
    'Nap',
    'Activities',
    'Diapers',
    'Notes',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Agenda'),
          backgroundColor: Colors.blueAccent),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return AgendaWideLayout(categories: categories);
          } else {
            return const AgendaMobileLayout(categories: categories);
          }
        },
      ),
    );
  }
}