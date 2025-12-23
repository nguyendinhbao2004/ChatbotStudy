import 'package:flutter/foundation.dart';
import '../../data/mock_auth_repository.dart';
import '../../domain/entities/user.dart';

class AuthController extends ChangeNotifier {
  final MockAuthRepository _repository;
  bool _loading = false;
  User? _currentUser;
  String? _error;

  AuthController({MockAuthRepository? repository})
      : _repository = repository ?? MockAuthRepository();

  bool get loading => _loading;
  User? get currentUser => _currentUser;
  String? get error => _error;

  Future<bool> login(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    final user = await _repository.login(email, password);
    _loading = false;
    if (user == null) {
      _error = 'Email hoặc mật khẩu không đúng';
      notifyListeners();
      return false;
    }
    _currentUser = user;
    notifyListeners();
    return true;
  }
}
