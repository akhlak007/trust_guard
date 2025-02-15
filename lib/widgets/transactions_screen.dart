/*import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transactions")),
      body: const Center(
        child: Text("Transaction List Will Be Shown Here"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          bool isFraud = index % 2 == 0;
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: isFraud ? Colors.red[100] : Colors.white,
            child: ListTile(
              leading: Icon(
                isFraud ? Icons.warning : Icons.shopping_cart,
                color: isFraud ? Colors.red : Colors.green,
              ),
              title: Text(isFraud ? 'Fraud Alert: Unknown Payment' : 'Grocery Shopping'),
              subtitle: Text(isFraud ? 'Potential Fraud' : 'Approved'),
              trailing: Text(
                isFraud ? '-\$250.00' : '-\$50.00',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isFraud ? Colors.red : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            bool isFraud = index % 2 == 0;
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              color: isFraud ? Colors.red[50] : Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: isFraud ? Colors.red : Colors.green,
                  child: Icon(
                    isFraud ? Icons.warning : Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  isFraud ? 'Fraud Alert: Unknown Payment' : 'Grocery Shopping',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isFraud ? Colors.red[900] : Colors.black,
                  ),
                ),
                subtitle: Text(
                  isFraud ? '🚨 Potential Fraud Detected' : '✅ Approved',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isFraud ? Colors.red : Colors.green,
                  ),
                ),
                trailing: Text(
                  isFraud ? '-\$250.00' : '-\$50.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isFraud ? Colors.red[900] : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

