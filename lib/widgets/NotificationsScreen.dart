import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationTile('Payment Received', 'You received \$500 from John.', Icons.attach_money),
          _buildNotificationTile('Bill Reminder', 'Electricity bill due in 2 days.', Icons.warning),
          _buildNotificationTile('Budget Alert', 'You’ve spent 80% of your budget.', Icons.pie_chart),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(String title, String subtitle, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
