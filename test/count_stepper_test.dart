import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:count_stepper/count_stepper.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  group('Test Decrement', () {
    testWidgets('Test Widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CountStepper()),
      ));
      await tester.tap(find.byType(IconButton).first);
      await tester.pump();
      expect(find.text('-1'), findsOneWidget);
      await tester.tap(find.byType(IconButton).first);
      await tester.pump();
      expect(find.text('-2'), findsOneWidget);
      expect(find.text('-3'), findsNothing);
    });
    testWidgets('Test Controller', (tester) async {
      StepperController _controller = StepperController();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CountStepper(
          controller: _controller,
        )),
      ));
      await tester.tap(find.byType(IconButton).first);
      await tester.pump();
      expect(_controller.currentValue, -1);
      await tester.tap(find.byType(IconButton).first);
      await tester.pump();
      expect(_controller.currentValue, -2);
    });
  });
  group('Test Increment', () {
    testWidgets('Test Widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CountStepper()),
      ));
      await tester.tap(find.byType(IconButton).last);
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      await tester.tap(find.byType(IconButton).last);
      await tester.pump();
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsNothing);
    });
    testWidgets('Test Controller', (tester) async {
      StepperController _controller = StepperController();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CountStepper(
          controller: _controller,
        )),
      ));
      await tester.tap(find.byType(IconButton).last);
      await tester.pump();
      expect(_controller.currentValue, 1);
      await tester.tap(find.byType(IconButton).last);
      await tester.pump();
      expect(_controller.currentValue, 2);
    });
  });
}
