import 'dart:async';
import '../../auth/domain/entities/user.dart';

class MockAuthRepository {
  final Map<String, User> _users = {
    'student@example.com': const User(
      id: '1',
      email: 'student@example.com',
      name: 'Student',
      role: 'student',
    ),
    'teacher@example.com': const User(
      id: '2',
      email: 'teacher@example.com',
      name: 'Teacher',
      role: 'teacher',
    ),
    'admin@example.com': const User(
      id: '3',
      email: 'admin@example.com',
      name: 'Admin',
      role: 'admin',
    ),
  };

  final String _password = '123456';

  Future<User?> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (password == _password && _users.containsKey(email.trim())) {
      return _users[email.trim()];
    }
    return null;
  }
}
