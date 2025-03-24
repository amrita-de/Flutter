import 'package:flutter/material.dart';
import 'Pages/login_page.dart';
import 'Pages/signup_page.dart';
import 'Pages/dashboard_page.dart';
import 'Pages/notice_page.dart';
import 'Pages/assignment_page.dart';
import 'Pages/admin_panel.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/signup': (context) => SignupPage(),
      '/dashboard': (context) => DashboardPage(),
      '/assignments': (context) => AssignmentPage(),
      '/notices': (context) => NoticePage(),
      '/admin': (context) => AdminPanel(), // ✅ Add Admin Panel
    },
  ));
}
