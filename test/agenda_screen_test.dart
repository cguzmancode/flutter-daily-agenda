import 'package:daily_agenda/cubit/agenda_cubit.dart';
import 'package:daily_agenda/data/mock_data.dart';
import 'package:daily_agenda/screens/agenda_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  Widget createTestWidget({required AgendaCubit cubit}) {
    return MaterialApp(
      home: BlocProvider.value(
        value: cubit,
        child: const AgendaScreen(),
      ),
    );
  }

  Future<void> runTest(Future<void> Function() body) async {
    await mockNetworkImagesFor(body);
  }



  testWidgets('selects and deselects a category filter', (WidgetTester tester) async {
    await runTest(() async {
      final cubit = AgendaCubit();
      cubit.selectChild(mockChildren.first.id);

      await tester.pumpWidget(createTestWidget(cubit: cubit));
      await tester.pumpAndSettle();

      final napChip = find.widgetWithText(ChoiceChip, 'Nap');
      expect(napChip, findsOneWidget);

      await tester.tap(napChip);
      await tester.pumpAndSettle();

      await tester.tap(napChip);
      await tester.pumpAndSettle();
    });
  });

  testWidgets('shows "No events found." when no matches', (WidgetTester tester) async {
    await runTest(() async {
      final cubit = AgendaCubit();
      cubit.selectChild('non_existing_id');

      await tester.pumpWidget(createTestWidget(cubit: cubit));
      await tester.pumpAndSettle();

      expect(find.text('No events found.'), findsOneWidget);
    });
  });
}
