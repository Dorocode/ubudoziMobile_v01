import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://192.168.19.197:3000/tailors";
  Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/tlogin"),
        body: jsonEncode({"email": email, "password": password}),
        headers: {"Content-Type": "application/json"},
      );
      print("Response  Status code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data["token"]; // Return JWT token
      } else {
        print("Login Failed: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error during login:$e");
      return null;
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
