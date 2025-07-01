import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/cubit/agenda_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryFilterBar extends StatelessWidget {
  const CategoryFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = const ['Feeding', 'Nap', 'Activities', 'Diapers', 'Notes'];
    return BlocBuilder<AgendaCubit, AgendaState>(
      builder: (context, state) {
        return SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = state.selectedCategory == category;
              return ChoiceChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (_) {
                  context.read<AgendaCubit>().selectCategory(
                    isSelected ? null : category,
                  );
                },
                selectedColor: Colors.blueAccent,
                backgroundColor: Colors.grey[200],
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
