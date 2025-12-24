import 'package:flutter/material.dart';
import '../../data/mock_course_repository.dart';
import '../../domain/entities/course.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final MockCourseRepository _repo = MockCourseRepository();
  late Future<List<Course>> _future;

  @override
  void initState() {
    super.initState();
    _future = _repo.fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Khóa học')),
      body: FutureBuilder<List<Course>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snapshot.data ?? const <Course>[];
          if (items.isEmpty) {
            return const Center(child: Text('Không có khóa học'));
          }
          return ListView.separated(
            key: const Key('coursesList'),
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final c = items[index];
              return _CourseTile(course: c);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: items.length,
          );
        },
      ),
    );
  }
}

class _CourseTile extends StatelessWidget {
  final Course course;
  const _CourseTile({required this.course});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      key: Key('course_${course.id}'),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.menu_book, color: cs.onSecondaryContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  course.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Chip(label: Text(course.level)),
                    const SizedBox(width: 8),
                    Chip(label: Text('${course.lessons} bài học')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
