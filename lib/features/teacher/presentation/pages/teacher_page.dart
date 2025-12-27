import 'package:flutter/material.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Teacher Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TeacherCard(
            icon: Icons.class_outlined,
            title: 'My Courses',
            subtitle: 'Manage your assigned courses',
            color: colorScheme.primaryContainer,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _TeacherCard(
            icon: Icons.trending_up,
            title: 'Student Progress',
            subtitle: 'Track student performance',
            color: colorScheme.secondaryContainer,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _TeacherCard(
            icon: Icons.add_circle_outline,
            title: 'Create Course',
            subtitle: 'Add new learning materials',
            color: colorScheme.tertiaryContainer,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _TeacherCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _TeacherCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon, size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
