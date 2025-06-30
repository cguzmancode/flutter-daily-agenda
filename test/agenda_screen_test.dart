import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/screens/agenda_screen.dart';
import 'package:daily_agenda/widgets/category_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => AgendaCubit(),
        child: const AgendaScreen(),
      ),
    );
  }

  Future<void> runTest(Future<void> Function() body) async {
    await mockNetworkImagesFor(body);
  }

  testWidgets('renders child dropdown and category buttons', (WidgetTester tester) async {
    await runTest(() async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsOneWidget);

      final categorySelector = find.byType(CategorySelectorWidget);
      expect(categorySelector, findsOneWidget);

      final scrollable = find.descendant(
        of: categorySelector,
        matching: find.byType(Scrollable),
      );
      expect(scrollable, findsOneWidget);

      for (final category in ['Feeding', 'Nap', 'Activities', 'Diapers', 'Notes']) {
        final button = find.descendant(
          of: categorySelector,
          matching: find.byKey(Key('category_button_$category')),
        );

        await tester.scrollUntilVisible(
          button,
          100.0,
          scrollable: scrollable,
        );

        expect(button, findsOneWidget);
      }
    });
  });

  testWidgets('selects and deselects a category filter', (WidgetTester tester) async {
    await runTest(() async {
      await tester.pumpWidget(createTestWidget());

      final napButton = find.byKey(const Key('category_button_Nap'));

      await tester.tap(napButton);
      await tester.pump();

      await tester.tap(napButton);
      await tester.pump();

      expect(napButton, findsOneWidget);
    });
  });

  testWidgets('shows "No events found." when no matches', (WidgetTester tester) async {
    await runTest(() async {
      await tester.pumpWidget(createTestWidget());

      final BuildContext context = tester.element(find.byType(AgendaScreen));
      final cubit = BlocProvider.of<AgendaCubit>(context);

      cubit.selectChild('non_existing_id');
      await tester.pumpAndSettle();

      expect(find.text('No events found.'), findsOneWidget);
    });
  });
}
