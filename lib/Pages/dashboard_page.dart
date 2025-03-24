import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Welcome!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _dashboardCard(
                    icon: Icons.notifications,
                    title: "Notices",
                    onTap: () => Navigator.pushNamed(context, '/notices'),
                  ),
                  _dashboardCard(
                    icon: Icons.assignment,
                    title: "Assignments",
                    onTap: () => Navigator.pushNamed(context, '/assignments'),
                  ),
                  _dashboardCard(
                    icon: Icons.people,
                    title: "Students",
                    onTap: () {},
                  ),
                  _dashboardCard(
                    icon: Icons.calendar_today,
                    title: "Schedule",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.purple[50], // Light Purple Background
    );
  }

  Widget _dashboardCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
