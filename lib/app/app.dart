import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/chat/presentation/pages/home_page.dart';
import '../features/course/presentation/pages/courses_page.dart';
import 'main_tabs.dart';
import '../features/chat/presentation/pages/chat_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/admin/presentation/pages/admin_tabs_page.dart';
import '../features/teacher/presentation/pages/teacher_tabs_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot Study',
      theme: AppTheme.light,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/courses': (context) => const CoursesPage(),
        '/main': (context) => const MainTabsPage(),
        '/chat': (context) => const ChatPage(),
        '/profile': (context) => const ProfilePage(),
        '/admin': (context) => const AdminTabsPage(),
        '/teacher': (context) => const TeacherTabsPage(),
      },
    );
  }
}
