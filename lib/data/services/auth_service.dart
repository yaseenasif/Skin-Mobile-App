import 'package:skinner/core/utils/toast_utils.dart';
import 'package:skinner/data/services/api/api_service.dart';

import '../models/user_model.dart';

class AuthService {
  // Mock user data
  UserModel? _loggedInUser;

  Future<bool> login(String username, String password) async {
    try {
      final data = {"username": username, "password": password};
      final response = await ApiService().post('/login', data: data);
      if (response.statusCode! >= 200 || response.statusCode! < 300) {
        // final data = response.data['data'];
        return true;
      }
    } catch (e) {
      ToastUtil.showError(e.toString());
    }
    return false;
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      final data = {"email": email, "username": name, "password": password};
      final response = await ApiService().post('/register', data: data);
      if (response.statusCode! >= 200 || response.statusCode! < 300) {
        // final data = response.data['data'];
        // return UserModel.fromJson(data);
        return true;
      }
    } catch (e) {
      ToastUtil.showError(e.toString());
    }
    return false;
  }

  UserModel? get loggedInUser => _loggedInUser;
}
