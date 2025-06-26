import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/screens/agenda_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const DailyAgendaApp());
}

class DailyAgendaApp extends StatelessWidget {
  const DailyAgendaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AgendaCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AgendaScreen(),
      ),
    );
  }
}