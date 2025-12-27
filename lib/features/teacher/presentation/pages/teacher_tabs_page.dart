import 'package:flutter/material.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import 'teacher_page.dart';

class TeacherTabsPage extends StatefulWidget {
  const TeacherTabsPage({super.key});

  @override
  State<TeacherTabsPage> createState() => _TeacherTabsPageState();
}

class _TeacherTabsPageState extends State<TeacherTabsPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.class_outlined),
            selectedIcon: Icon(Icons.class_),
            label: 'Teaching',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_index) {
      case 0:
        return const TeacherPage();
      case 1:
        return const ProfilePage();
      default:
        return const TeacherPage();
    }
  }
}
