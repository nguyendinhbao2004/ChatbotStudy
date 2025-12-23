import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chatbotstudy/app/app.dart';

void main() {
  testWidgets('Login navigates to Home with correct credentials',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byKey(const Key('loginButton')), findsOneWidget);
    await tester.enterText(
        find.byKey(const Key('emailField')), 'student@example.com');
    await tester.enterText(
        find.byKey(const Key('passwordField')), '123456');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
    expect(find.text('Đăng nhập'), findsNothing);
    expect(find.text('Trang chủ'), findsOneWidget);
    expect(find.byKey(const Key('homeCoursesCard')), findsOneWidget);
    expect(find.byKey(const Key('homeChatbotCard')), findsOneWidget);
  });
}
