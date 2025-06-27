import 'package:equatable/equatable.dart';

class AgendaState extends Equatable {
  final String selectedChildId;
  final String? selectedCategory;

  const AgendaState({this.selectedChildId= '', this.selectedCategory});

  AgendaState copyWith({String? selectedChildId, String? selectedCategory}) {
    return AgendaState(
      selectedChildId: selectedChildId ?? this.selectedChildId,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [selectedChildId, selectedCategory];
}
