import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/screens/agenda_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => AgendaCubit(),
        child: const AgendaScreen(),
      ),
    );
  }

  testWidgets('renders child dropdown and category buttons', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.byType(DropdownButton<String>), findsOneWidget);

    for (final category in ['Feeding', 'Nap', 'Activities', 'Diapers', 'Notes']) {
      expect(find.byKey(Key('category_button_$category')), findsOneWidget);
    }
  });

  testWidgets('selects and deselects a category filter', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    final napButton = find.byKey(const Key('category_button_Nap'));

    await tester.tap(napButton);
    await tester.pump();

    await tester.tap(napButton);
    await tester.pump();

    expect(napButton, findsOneWidget);
  });

  testWidgets('shows "No events found." when no matches', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    final BuildContext context = tester.element(find.byType(AgendaScreen));
    final cubit = BlocProvider.of<AgendaCubit>(context);

    cubit.selectChild('non_existing_id');
    await tester.pumpAndSettle();

    expect(find.text('No events found.'), findsOneWidget);
  });
}
