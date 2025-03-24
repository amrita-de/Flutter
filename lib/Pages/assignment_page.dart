import 'package:flutter/material.dart';

class AssignmentPage extends StatelessWidget {
  final List<Map<String, String>> assignments = [
    {"title": "Math Homework", "due": "Due: March 10"},
    {"title": "Science Project", "due": "Due: March 15"},
    {"title": "History Essay", "due": "Due: March 20"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text("Assignments", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: assignments.map((assignment) => _assignmentCard(assignment)).toList(),
        ),
      ),
    );
  }

  Widget _assignmentCard(Map<String, String> assignment) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.deepPurple,
      child: ListTile(
        title: Text(assignment["title"]!, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(assignment["due"]!, style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {},
      ),
    );
  }
}
