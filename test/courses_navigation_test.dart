import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chatbotstudy/app/app.dart';

void main() {
  testWidgets('Navigate to Courses and show list', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.enterText(
        find.byKey(const Key('emailField')), 'student@example.com');
    await tester.enterText(
        find.byKey(const Key('passwordField')), '123456');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Trang chủ'), findsOneWidget);
    await tester.tap(find.text('Courses'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Khóa học'), findsOneWidget);
    expect(find.byKey(const Key('coursesList')), findsOneWidget);
    expect(find.byKey(const Key('course_c1')), findsOneWidget);
    expect(find.byKey(const Key('course_c2')), findsOneWidget);
    expect(find.byKey(const Key('course_c3')), findsOneWidget);
  });
}
