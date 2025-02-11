import 'dart:convert';
import 'dart:developer';

import 'package:grocery_shopping_app/features/authentication/data/data_provider/auth_data_provider.dart';
import 'package:grocery_shopping_app/features/authentication/model/auth_verify_model.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository(this.authDataProvider);

  Future<AuthVerifyModel> verifyUser(String phone) async {
    log("repo keriiii");
    try {
      final response = await authDataProvider.verifyUser(phone);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log("data >>> $data");
        return AuthVerifyModel.fromJson(data);
      } else {
        throw Exception("Failed to verify user: ${response.body}");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
