import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/cubit/agenda_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/mock_data.dart';

class ChildDropdownWidget extends StatelessWidget {
  const ChildDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaCubit, AgendaState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: mockChildren.any((c) => c.id == state.selectedChildId)
              ? state.selectedChildId
              : '',
          isExpanded: true,
          items: [
            const DropdownMenuItem(value: '', child: Text('All children')),
            ...mockChildren.map((child) =>
                DropdownMenuItem(
                  value: child.id,
                  child: Text(child.name),
                )),
          ],
          onChanged: (value) {
            if (value == null) return;
            context.read<AgendaCubit>().selectChild(value);
          },
        );
      },
    );
  }
}
