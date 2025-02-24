import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://192.168.19.197:3000/tailors";
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/tlogin"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      // print("Response  Status code: ${response.statusCode}");
      // print("Response Body: ${response.body}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String? token = data['token'];
        if (token != null && token.isNotEmpty) {
          print("Login successful. Token: $token");
          return true;
        }
      }
      print("Login Failed. Response: ${response.body}");
      return false;
    } catch (e) {
      print("Error during login: $e");
      return false;
    }
  }

  Future<bool> signup(
      String name, String email, String phone, String password) async {
    final url = Uri.parse("$baseUrl/tsignup");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
        }),
      );

      if (response.statusCode == 201) {
        print("Signup successful: ${response.body}");
        return true;
      } else {
        print("Signup failed: ${response.body}");
        return false;
      }
    } catch (error) {
      print("Error during signup: $error");
      return false;
    }
  }
}
