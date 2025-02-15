/*import 'package:flutter/material.dart';

class AdminUserListItem extends StatelessWidget {
  final String username;
  final String email;
  final double totalSpending;
  final bool isBanned;

  const AdminUserListItem({
    super.key,
    required this.username,
    required this.email,
    required this.totalSpending,
    required this.isBanned,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (isBanned)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'BANNED',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Spending',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '\$${totalSpending.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                FilledButton(
                  onPressed: isBanned ? null : () {
                    // TODO: Implement ban user functionality
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Ban User'),
                        content: Text('Are you sure you want to ban $username?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          FilledButton(
                            onPressed: () {
                              // TODO: Implement ban user logic
                              Navigator.pop(context);
                            },
                            child: const Text('Ban User'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: isBanned ? Colors.grey : Colors.red,
                  ),
                  child: Text(isBanned ? 'Banned' : 'Ban User'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AdminUserListItem extends StatefulWidget {
  final String username;
  final String email;
  final double totalSpending;
  final bool isBanned;
  final Function(bool) onBanToggle; // Callback function

  const AdminUserListItem({
    super.key,
    required this.username,
    required this.email,
    required this.totalSpending,
    required this.isBanned,
    required this.onBanToggle,
  });

  @override
  _AdminUserListItemState createState() => _AdminUserListItemState();
}

class _AdminUserListItemState extends State<AdminUserListItem> {
  late bool _isBanned;

  @override
  void initState() {
    super.initState();
    _isBanned = widget.isBanned;
  }

  void _toggleBanStatus() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_isBanned ? 'Unban User' : 'Ban User'),
        content: Text(
          'Are you sure you want to ${_isBanned ? 'unban' : 'ban'} ${widget.username}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                _isBanned = !_isBanned;
              });
              widget.onBanToggle(_isBanned); // Trigger callback
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: _isBanned ? Colors.green : Colors.red,
            ),
            child: Text(_isBanned ? 'Unban' : 'Ban'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: _isBanned ? Colors.red : Colors.green,
                  child: Icon(
                    _isBanned ? Icons.block : Icons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.email,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isBanned)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'BANNED',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Spending',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '\$${widget.totalSpending.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                FilledButton(
                  onPressed: _toggleBanStatus,
                  style: FilledButton.styleFrom(
                    backgroundColor: _isBanned ? Colors.green : Colors.red,
                  ),
                  child: Text(_isBanned ? 'Unban' : 'Ban User'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:trust_guard/screens/flag_account_screen.dart';

class AdminUserListItem extends StatefulWidget {
  final String username;
  final String email;
  final double totalSpending;
  final bool isBanned;
  final Function(bool) onBanToggle;
  final Function(String) onFlagAccount; // Callback for flagging

  const AdminUserListItem({
    super.key,
    required this.username,
    required this.email,
    required this.totalSpending,
    required this.isBanned,
    required this.onBanToggle,
    required this.onFlagAccount,
  });

  @override
  _AdminUserListItemState createState() => _AdminUserListItemState();
}

class _AdminUserListItemState extends State<AdminUserListItem> {
  late bool _isBanned;

  @override
  void initState() {
    super.initState();
    _isBanned = widget.isBanned;
  }

  void _toggleBanStatus() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_isBanned ? 'Unban User' : 'Ban User'),
        content: Text(
          'Are you sure you want to ${_isBanned ? 'unban' : 'ban'} ${widget.username}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                _isBanned = !_isBanned;
              });
              widget.onBanToggle(_isBanned);
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: _isBanned ? Colors.green : Colors.red,
            ),
            child: Text(_isBanned ? 'Unban' : 'Ban'),
          ),
        ],
      ),
    );
  }

  void _flagAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlagAccountScreen(
          username: widget.username,
          onFlagSubmit: widget.onFlagAccount,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: _isBanned ? Colors.red : Colors.green,
                  child: Icon(
                    _isBanned ? Icons.block : Icons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.email,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isBanned)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'BANNED',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Spending',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '\$${widget.totalSpending.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FilledButton(
                      onPressed: _flagAccount,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Flag Account'),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: _toggleBanStatus,
                      style: FilledButton.styleFrom(
                        backgroundColor: _isBanned ? Colors.green : Colors.red,
                      ),
                      child: Text(_isBanned ? 'Unban' : 'Ban'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:trust_guard/screens/flag_account_screen.dart';
import 'package:trust_guard/screens/flagged_account_screen.dart';
// Import the new screen

class AdminUserListItem extends StatefulWidget {
  final String username;
  final String email;
  final double totalSpending;
  final bool isBanned;
  final Function(bool) onBanToggle;
  final Function(String) onFlagAccount; // Callback for flagging

  const AdminUserListItem({
    super.key,
    required this.username,
    required this.email,
    required this.totalSpending,
    required this.isBanned,
    required this.onBanToggle,
    required this.onFlagAccount,
  });

  @override
  _AdminUserListItemState createState() => _AdminUserListItemState();
}

class _AdminUserListItemState extends State<AdminUserListItem> {
  late bool _isBanned;

  @override
  void initState() {
    super.initState();
    _isBanned = widget.isBanned;
  }

  void _toggleBanStatus() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_isBanned ? 'Unban User' : 'Ban User'),
        content: Text(
          'Are you sure you want to ${_isBanned ? 'unban' : 'ban'} ${widget.username}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                _isBanned = !_isBanned;
              });
              widget.onBanToggle(_isBanned);
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: _isBanned ? Colors.green : Colors.red,
            ),
            child: Text(_isBanned ? 'Unban' : 'Ban'),
          ),
        ],
      ),
    );
  }

  void _flagAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlagAccountScreen(
          username: widget.username,
          onFlagSubmit: widget.onFlagAccount,
        ),
      ),
    );
  }

  void _navigateToFlaggedAccounts() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlaggedAccountsScreen(), // Navigate to flagged accounts screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: _isBanned ? Colors.red : Colors.green,
                  child: Icon(
                    _isBanned ? Icons.block : Icons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.email,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isBanned)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'BANNED',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Spending',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '\$${widget.totalSpending.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FilledButton(
                      onPressed: _flagAccount,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Flag Account'),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: _toggleBanStatus,
                      style: FilledButton.styleFrom(
                        backgroundColor: _isBanned ? Colors.green : Colors.red,
                      ),
                      child: Text(_isBanned ? 'Unban' : 'Ban'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: FilledButton(
                onPressed: _navigateToFlaggedAccounts,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text('View Flagged Accounts'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


