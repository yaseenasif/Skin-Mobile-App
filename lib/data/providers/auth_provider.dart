import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authProvider =
    AsyncNotifierProvider<AuthNotifier, UserModel?>(AuthNotifier.new);

class AuthNotifier extends AsyncNotifier<UserModel?> {
  Future<bool> login(String username, String password) async {
    // Handle login
    try {
      final service = ref.read(authServiceProvider);
      final user = await service.login(username, password);
      if (user == false) {
        state = AsyncValue.error('Login failed', StackTrace.current);
        return false;
      }
      return true;
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      final service = ref.read(authServiceProvider);
      final user = await service.signUp(name, email, password);
      if (user == false) {
        state = AsyncValue.error('Sign up failed', StackTrace.current);
        return false;
      }
      return true;
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
      return false;
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.data(null);
  }

  @override
  FutureOr<UserModel?> build() {
    return null;
  }
}
