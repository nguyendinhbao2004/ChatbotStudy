import 'dart:async';
import '../../auth/domain/entities/user.dart';

class MockAuthRepository {
  final String _email = 'student@example.com';
  final String _password = '123456';
  final User _user = const User(
    id: '1',
    email: 'student@example.com',
    name: 'Student',
  );

  Future<User?> login(String email, String password) async {
    if (email.trim() == _email && password == _password) {
      return _user;
    }
    return null;
  }
}
