import 'package:flutter/material.dart';

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
}