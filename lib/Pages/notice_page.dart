import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  final List<Map<String, String>> notices = [
    {"title": "School Reopening", "date": "March 5, 2025"},
    {"title": "Exam Schedule", "date": "March 12, 2025"},
    {"title": "PTA Meeting", "date": "March 18, 2025"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text("Notices", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: notices.map((notice) => _noticeCard(notice)).toList(),
        ),
      ),
    );
  }

  Widget _noticeCard(Map<String, String> notice) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.deepPurple,
      child: ListTile(
        title: Text(notice["title"]!, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(notice["date"]!, style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.notifications, color: Colors.white),
        onTap: () {},
      ),
    );
  }
}
