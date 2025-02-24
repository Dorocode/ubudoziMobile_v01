import 'package:flutter/material.dart';
import 'package:ubudozimob_v01/utils/shared_prefs.dart';
import 'signup_screen.dart';
import '../services/auth_service.dart';
import '../screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleLogin() async {
    print("Login function started!");
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter both email and password")));
      return;
    }
    print("Email: $email, Password: $password"); //check if input it correct

    // String? token = await AuthService().login(email, password);
    // if (token != null) {
    //   print("Login Sucessuful! Token: $token");
    //   await SharedPrefs.saveToken(token);
    //   //store token for the future use
    // } else {
    //   print("Login failed");
    // }

    bool loginSuccess = await AuthService().login(email, password);

    if (loginSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed. Check your credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              const Color.fromARGB(255, 87, 158, 152)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              Text(
                "UBUDOZI",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 76, 82),
                ),
              ),
              SizedBox(height: 0),
              Image.asset(
                "images/ubudozi.png", // Your custom PNG
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                          child: Text("Sign Up"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password"),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print("login button clicked");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Sign in",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 2, 76, 82))),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
