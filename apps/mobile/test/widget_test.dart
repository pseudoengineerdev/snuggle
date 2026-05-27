import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snuggle_mobile/app/snuggle_app.dart';

void main() {
  testWidgets('shows onboarding before entering home dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SnuggleApp());

    expect(find.text('Onboarding'), findsOneWidget);
    expect(find.text('Welcome To Snuggle'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Invite link shared with partner'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Partner has joined'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Enter Snuggle'));
    await tester.pumpAndSettle();

    expect(find.text('Snuggle'), findsOneWidget);
    expect(find.text('Home'), findsWidgets);
    expect(find.text('Shared House'), findsOneWidget);
    expect(find.text('Daily Mood Ritual'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Shared Companion'),
      300,
      scrollable: find.byType(Scrollable).first,
    );

    expect(find.text('Shared Companion'), findsOneWidget);
  });
}
