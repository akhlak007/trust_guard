import 'package:flutter/material.dart';

class FlagAccountScreen extends StatefulWidget {
  final String username;
  final Function(String) onFlagSubmit;

  const FlagAccountScreen({
    super.key,
    required this.username,
    required this.onFlagSubmit,
  });

  @override
  _FlagAccountScreenState createState() => _FlagAccountScreenState();
}

class _FlagAccountScreenState extends State<FlagAccountScreen> {
  final TextEditingController _reasonController = TextEditingController();

  void _submitFlag() {
    final reason = _reasonController.text.trim();
    if (reason.isNotEmpty) {
      widget.onFlagSubmit(reason);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flag Account: ${widget.username}'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Provide a reason for flagging this account:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(
                hintText: 'Enter reason...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Center(
              child: FilledButton(
                onPressed: _submitFlag,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text('Submit Flag'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


