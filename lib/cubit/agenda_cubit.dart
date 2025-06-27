import 'package:daily_agenda/cubit/agenda_state.dart';
import 'package:daily_agenda/data/mock_data.dart';
import 'package:daily_agenda/models/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgendaCubit extends Cubit<AgendaState> {
  AgendaCubit() : super(const AgendaState());

  void selectChild(String? childId) {
    emit(state.copyWith(selectedChildId: childId ?? ''));
  }

  void selectCategory(String? category) {
    if (category == null) {
      emit(state.copyWith(resetCategory: true));
    } else {
      emit(state.copyWith(selectedCategory: category));
    }
  }

  List<Event> getFilteredEvents() {
    return mockEvents.where((event) {
      final matchesChild = state.selectedChildId.isEmpty || event.childId == state.selectedChildId;
      final matchesCategory = state.selectedCategory == null || event.category == state.selectedCategory;
      return matchesChild && matchesCategory;
    }).toList();
  }
}
