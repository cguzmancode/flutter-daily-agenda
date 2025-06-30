import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/cubit/agenda_state.dart';
import 'package:daily_agenda/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/mock_data.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaCubit, AgendaState>(
      builder: (context, state) {
        final filteredEvents = context.read<AgendaCubit>().getFilteredEvents();

        if (filteredEvents.isEmpty) {
          return const Center(child: Text('No events found.'));
        }

        return ListView.builder(
          itemCount: filteredEvents.length,
          itemBuilder: (context, index) {
            final event = filteredEvents[index];
            final child = mockChildren.firstWhere((c) => c.id == event.childId);
            return EventCard(child: child, event: event);
          },
        );
      },
    );
  }
}