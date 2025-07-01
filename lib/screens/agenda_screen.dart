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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        title: const Text(
          'Daily Agenda',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/75.jpg'),
              radius: 18,
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black87),
      ),

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