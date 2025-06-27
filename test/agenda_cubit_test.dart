import 'package:flutter_test/flutter_test.dart';
import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/data/mock_data.dart';

void main() {
  group('AgendaCubit', () {
    late AgendaCubit cubit;

    setUp(() {
      cubit = AgendaCubit();
    });

    test('returns all events by default', () {
      final events = cubit.getFilteredEvents();
      expect(events.length, mockEvents.length);
    });

    test('filters events by selected child', () {
      cubit.selectChild('1');
      final events = cubit.getFilteredEvents();
      expect(events.every((e) => e.childId == '1'), isTrue);
    });

    test('filters events by selected category', () {
      cubit.selectCategory('Nap');
      final events = cubit.getFilteredEvents();
      expect(events.every((e) => e.category == 'Nap'), isTrue);
    });

    test('filters events by both selected child and category', () {
      cubit.selectChild('1');
      cubit.selectCategory('Nap');
      final events = cubit.getFilteredEvents();
      expect(events.every((e) => e.childId == '1' && e.category == 'Nap'), isTrue);
    });

    test('shows all events again when filters are reset', () {
      cubit.selectChild('');
      cubit.selectCategory(null);
      final events = cubit.getFilteredEvents();
      expect(events.length, mockEvents.length);
    });
  });
}
