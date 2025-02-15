/*import 'package:flutter/material.dart';

class FlaggedAccountsScreen extends StatelessWidget {
  final List<Map<String, String>> flaggedUsers = [
    {"username": "john_doe", "email": "john@example.com", "reason": "Suspicious activity"},
    {"username": "alice_smith", "email": "alice@example.com", "reason": "Spamming users"},
    {"username": "mark_lee", "email": "mark@example.com", "reason": "Inappropriate content"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flagged Accounts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: flaggedUsers.isEmpty
          ? const Center(
        child: Text(
          'No flagged accounts found.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: flaggedUsers.length,
        itemBuilder: (context, index) {
          final user = flaggedUsers[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.flag, color: Colors.white),
              ),
              title: Text(user["username"]!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user["email"]!, style: TextStyle(color: Colors.grey[600])),
                  Text("Reason: ${user["reason"]!}", style: TextStyle(color: Colors.red[800])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

class FlaggedAccountsScreen extends StatelessWidget {
  final List<Map<String, String>> flaggedUsers = [
    {"username": "john_doe", "email": "john@example.com", "reason": "Suspicious activity"},
    {"username": "alice_smith", "email": "alice@example.com", "reason": "Spamming users"},
    {"username": "mark_lee", "email": "mark@example.com", "reason": "Inappropriate content"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flagged Accounts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: flaggedUsers.isEmpty
          ? const Center(
        child: Text(
          'No flagged accounts found.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: flaggedUsers.length,
        itemBuilder: (context, index) {
          final user = flaggedUsers[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.flag, color: Colors.white),
              ),
              title: Text(user["username"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user["email"]!, style: TextStyle(color: Colors.grey[600])),
                  Text("Reason: ${user["reason"]!}", style: TextStyle(color: Colors.red[800])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

