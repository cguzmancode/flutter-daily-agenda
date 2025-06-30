import 'package:flutter/material.dart';

class DailyAgendaTitleWidget extends StatelessWidget {
  const DailyAgendaTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Daily Agenda',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
