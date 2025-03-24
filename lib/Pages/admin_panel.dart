import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  List<Map<String, String>> notices = [];
  List<Map<String, String>> assignments = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _assignmentTitleController = TextEditingController();
  final TextEditingController _assignmentDueController = TextEditingController();

  void _addNotice() {
    setState(() {
      notices.add({"title": _titleController.text, "date": _dateController.text});
      _titleController.clear();
      _dateController.clear();
    });
  }

  void _addAssignment() {
    setState(() {
      assignments.add({"title": _assignmentTitleController.text, "due": _assignmentDueController.text});
      _assignmentTitleController.clear();
      _assignmentDueController.clear();
    });
  }

  void _deleteNotice(int index) {
    setState(() {
      notices.removeAt(index);
    });
  }

  void _deleteAssignment(int index) {
    setState(() {
      assignments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text("Admin Panel", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Manage Notices", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              _inputField(_titleController, "Notice Title"),
              _inputField(_dateController, "Notice Date"),
              ElevatedButton(
                onPressed: _addNotice,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: Text("Add Notice"),
              ),
              _listView(notices, _deleteNotice),

              SizedBox(height: 20),
              Text("Manage Assignments", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              _inputField(_assignmentTitleController, "Assignment Title"),
              _inputField(_assignmentDueController, "Due Date"),
              ElevatedButton(
                onPressed: _addAssignment,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: Text("Add Assignment"),
              ),
              _listView(assignments, _deleteAssignment),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController controller, String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget _listView(List<Map<String, String>> items, Function(int) onDelete) {
    return Column(
      children: items.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, String> item = entry.value;
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.deepPurple,
          child: ListTile(
            title: Text(item["title"]!, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text(item["date"] ?? item["due"]!, style: TextStyle(color: Colors.white70)),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.white),
              onPressed: () => onDelete(index),
            ),
          ),
        );
      }).toList(),
    );
  }
}
