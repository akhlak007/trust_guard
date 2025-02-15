/*import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  final String title;
  final double amount;
  final String date;
  final String category;

  const TransactionListItem({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: amount < 0 ? Colors.red[100] : Colors.green[100],
          child: Icon(
            amount < 0 ? Icons.remove : Icons.add,
            color: amount < 0 ? Colors.red : Colors.green,
          ),
        ),
        title: Text(title),
        subtitle: Text('$category • $date'),
        trailing: Text(
          '\$${amount.abs().toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: amount < 0 ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  final String title;
  final double amount;
  final String date;
  final String category;
  final bool isFraud;

  const TransactionListItem({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.isFraud = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: isFraud ? Colors.red[100] : Colors.white,
      child: ListTile(
        leading: Icon(
          isFraud ? Icons.warning_amber_rounded : Icons.shopping_bag,
          color: isFraud ? Colors.red : Colors.green,
        ),
        title: Text(title),
        subtitle: Text('$date | $category'),
        trailing: Text(
          isFraud ? '-\$${amount.toStringAsFixed(2)}' : '-\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isFraud ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}
