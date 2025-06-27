import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/cubit/agenda_state.dart';
import 'package:daily_agenda/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/mock_data.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

  final List<String> categories = const [
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
        title: const Text('Daily Agenda'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Parent: Luis López',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            BlocBuilder<AgendaCubit, AgendaState>(
              builder: (context, state) {
                return DropdownButton<String>(
                  value: state.selectedChildId,
                  isExpanded: true,
                  items: [
                    const DropdownMenuItem<String>(
                      value: '',
                      child: Text('All children'),
                    ),
                    ...mockChildren.map((child) => DropdownMenuItem<String>(
                      value: child.id,
                      child: Text(child.name),
                    )),
                  ],
                  onChanged: (value) {
                    if (value == null) return;  // safety
                    context.read<AgendaCubit>().selectChild(value);
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Daily Agenda',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: BlocBuilder<AgendaCubit, AgendaState>(
                builder: (context, state) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = category == state.selectedCategory;
                      return GestureDetector(
                        onTap: () {
                          context.read<AgendaCubit>().selectCategory(
                            isSelected ? null : category,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blueAccent
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              category,
                              style: TextStyle(
                                color:
                                isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<AgendaCubit, AgendaState>(
                builder: (context, state) {
                  final filteredEvents = mockEvents.where((event) {
                    final matchesChild = state.selectedChildId.isEmpty || event.childId == state.selectedChildId;
                    final matchesCategory =
                        state.selectedCategory == null || event.category == state.selectedCategory;
                    return matchesChild && matchesCategory;
                  }).toList();

                  if (filteredEvents.isEmpty) {
                    return const Center(child: Text('No events found.'));
                  }

                  return ListView.builder(
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      final event = filteredEvents[index];
                      final child = mockChildren
                          .firstWhere((c) => c.id == event.childId);
                      return EventCard(child: child, event: event);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
