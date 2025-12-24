// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chatbotstudy/app/app.dart';

void main() {
  testWidgets('Login shows Main tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.enterText(
        find.byKey(const Key('emailField')), 'student@example.com');
    await tester.enterText(
        find.byKey(const Key('passwordField')), '123456');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Trang chủ'), findsOneWidget);
  });
}
