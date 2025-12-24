import '../domain/entities/course.dart';

class MockCourseRepository {
  Future<List<Course>> fetchCourses() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      Course(
        id: 'c1',
        title: 'Flutter Cơ Bản',
        description: 'Bắt đầu với widgets, layout và state.',
        level: 'Beginner',
        lessons: 24,
      ),
      Course(
        id: 'c2',
        title: 'Flutter Nâng Cao',
        description: 'Kiến trúc, performance và testing.',
        level: 'Advanced',
        lessons: 18,
      ),
      Course(
        id: 'c3',
        title: 'Dart Chuyên Sâu',
        description: 'Ngôn ngữ Dart và best practices.',
        level: 'Intermediate',
        lessons: 20,
      ),
    ];
  }
}
