import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthDataProvider {
  Future<http.Response> verifyUser(String phone) async {
    try {
      final Map<String, dynamic> data = {"phone_number": phone};
      final res = await http.post(
        Uri.parse("https://admin.kushinirestaurant.com/api/verify/"),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      return res;
    } catch (e) {
      throw e.toString();
    }
  }
}
