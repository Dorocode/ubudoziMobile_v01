import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class HomeScreen extends StatelessWidget {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo & Welcome Text
            Image.asset(
              "images/ubudozi.png",
              height: 180,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "Ubudozi Tailor App",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 2, 76, 82),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Manage your tailoring business with ease!",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Login Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 76, 82),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              icon: Icon(Icons.login, color: Colors.white),
              label: Text(
                "Login",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            // Sign Up Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                      color: const Color.fromARGB(255, 2, 76, 82), width: 2),
                ),
                elevation: 5,
              ),
              icon: Icon(Icons.person_add,
                  color: const Color.fromARGB(255, 2, 76, 82)),
              label: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 18, color: const Color.fromARGB(255, 2, 76, 82)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
