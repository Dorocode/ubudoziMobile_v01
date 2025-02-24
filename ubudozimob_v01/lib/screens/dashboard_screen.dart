import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tailor Dashboard"),
        backgroundColor: const Color.fromARGB(255, 2, 76, 82),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 2, 76, 82),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Tailor Name",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "tailor@example.com",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Orders"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Customers"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.payments),
              title: Text("Payments"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildDashboardItem(Icons.shopping_bag, "Orders", Colors.blue),
            _buildDashboardItem(Icons.people, "Customers", Colors.green),
            _buildDashboardItem(Icons.payments, "Payments", Colors.orange),
            _buildDashboardItem(Icons.settings, "Settings", Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(IconData icon, String title, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
