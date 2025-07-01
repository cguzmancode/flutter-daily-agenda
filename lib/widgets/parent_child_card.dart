import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/cubit/agenda_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/mock_data.dart';


class ParentChildCard extends StatelessWidget {
  const ParentChildCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<AgendaCubit, AgendaState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.person, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Parent: Luis López',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: mockChildren.any((c) => c.id == state.selectedChildId)
                      ? state.selectedChildId
                      : '',
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Select child',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  items: [
                    const DropdownMenuItem(value: '', child: Text('All children')),
                    ...mockChildren.map((child) => DropdownMenuItem(
                      value: child.id,
                      child: Text(child.name),
                    )),
                  ],
                  onChanged: (value) {
                    if (value == null) return;
                    context.read<AgendaCubit>().selectChild(value);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
