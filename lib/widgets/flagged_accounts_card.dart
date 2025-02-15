import 'package:flutter/material.dart';
import 'package:trust_guard/screens/flagged_account_screen.dart';
 // Import the screen

class FlaggedAccountsCard extends StatelessWidget {
  final int flaggedCount; // The number of flagged accounts

  const FlaggedAccountsCard({super.key, required this.flaggedCount});

  void _navigateToFlaggedAccounts(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  FlaggedAccountsScreen(), // Navigate to flagged accounts screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToFlaggedAccounts(context), // Navigate on tap
      child: Card(
        color: Colors.black87, // Background color
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Icon(Icons.warning, color: Colors.orange, size: 24), // Warning icon
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Flagged Accounts",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "$flaggedCount", // Show the flagged accounts count
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
