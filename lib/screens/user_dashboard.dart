/*import 'package:flutter/material.dart';
import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Total Expenses',
                      value: '\$2,459.50',
                      icon: Icons.account_balance_wallet,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DashboardCard(
                      title: 'Monthly Budget',
                      value: '\$5,000.00',
                      icon: Icons.pie_chart,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spending Overview',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: _buildSpendingChart(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const TransactionListItem(
                    title: 'Online Purchase',
                    amount: -85.99,
                    date: '2023-10-15',
                    category: 'Shopping',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),

            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long),
            label: 'Transactions',
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedIndex: 0,
        onDestinationSelected: (index) {
          // TODO: Implement navigation
        },
      ),
    );
  }

  Widget _buildSpendingChart() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: const Center(
        child: Text('Spending Chart Placeholder'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  void _initializeNotifications() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidInitSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initSettings =
    InitializationSettings(android: androidInitSettings);

    flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  void _showNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id', 'channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Notification',
      'You have a new update!',
      details,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const TransactionsScreen()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LeaderboardScreen()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: _showNotification,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Total Expenses',
                      value: '\$2,459.50',
                      icon: Icons.account_balance_wallet,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DashboardCard(
                      title: 'Monthly Budget',
                      value: '\$5,000.00',
                      icon: Icons.pie_chart,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spending Overview',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: _buildSpendingChart(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const TransactionListItem(
                    title: 'Online Purchase',
                    amount: -85.99,
                    date: '2023-10-15',
                    category: 'Shopping',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          NavigationDestination(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }

  Widget _buildSpendingChart() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: const Center(
        child: Text('Spending Chart Placeholder'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';
 // Import Settings Screen
import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransactionsScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trust Guard Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notification screen
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Total Expenses',
                      value: '\$2,459.50',
                      icon: Icons.account_balance_wallet,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DashboardCard(
                      title: 'Monthly Budget',
                      value: '\$5,000.00',
                      icon: Icons.pie_chart,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spending Overview',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: _buildSpendingChart(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  bool isFraud = index % 2 == 0; // Random fraud detection
                  return TransactionListItem(
                    title: isFraud ? 'Suspicious Purchase' : 'Online Purchase',
                    amount: isFraud ? -150.75 : -85.99,
                    date: '2023-10-15',
                    category: isFraud ? 'Potential Fraud' : 'Shopping',
                    isFraud: isFraud,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSpendingChart() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: const Center(
        child: Text('Spending Chart Placeholder'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    const LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Recent Transactions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                bool isFraud = index % 2 == 0;
                return TransactionListItem(
                  title: isFraud ? 'Suspicious Purchase' : 'Online Purchase',
                  amount: isFraud ? -150.75 : -85.99,
                  date: '2023-10-15',
                  category: isFraud ? 'Potential Fraud' : 'Shopping',
                  isFraud: isFraud,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trust_guard/widgets/NotificationsScreen.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    const LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Header with Notification Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Financial Summary Cards
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Loan/Debt Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.money_off, color: Colors.red),
                title: const Text('Outstanding Loan/Debt', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('\$1,200.00 - Due in 15 Days'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 24),

            // Pie Chart for Expense Distribution
            Text('Expense Breakdown', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 40, title: 'Rent'),
                    PieChartSectionData(color: Colors.green, value: 30, title: 'Food'),
                    PieChartSectionData(color: Colors.orange, value: 20, title: 'Transport'),
                    PieChartSectionData(color: Colors.red, value: 10, title: 'Others'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Line Graph for Monthly Expenses
            Text('Monthly Expenses Trend', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 100),
                        const FlSpot(1, 200),
                        const FlSpot(2, 300),
                        const FlSpot(3, 250),
                        const FlSpot(4, 350),
                      ],
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.blueAccent,
                      belowBarData: BarAreaData(show: true, color: Colors.blueAccent.withOpacity(0.3)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trust_guard/widgets/NotificationsScreen.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    const LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Header with Notification Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Financial Summary Cards
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Loan/Debt Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.money_off, color: Colors.red),
                title: const Text(
                  'Outstanding Loan/Debt',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('\$1,200.00 - Due in 15 Days'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Navigate to Loan/Debt Details
                },
              ),
            ),

            const SizedBox(height: 24),

            // Pie Chart for Expense Distribution
            Text('Expense Breakdown', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 40, title: 'Rent'),
                    PieChartSectionData(color: Colors.green, value: 30, title: 'Food'),
                    PieChartSectionData(color: Colors.orange, value: 20, title: 'Transport'),
                    PieChartSectionData(color: Colors.red, value: 10, title: 'Others'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Line Graph for Monthly Expenses
            Text('Monthly Expenses Trend', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text('Day ${value.toInt()}',
                              style: const TextStyle(fontSize: 12));
                        },
                        interval: 5, // Labels every 5 days
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(1, 50),  // Day 1 - $50 spent
                        const FlSpot(5, 120), // Day 5 - $120 spent
                        const FlSpot(10, 90), // Day 10 - $90 spent
                        const FlSpot(15, 200), // Day 15 - $200 spent
                        const FlSpot(20, 150), // Day 20 - $150 spent
                        const FlSpot(25, 300), // Day 25 - $300 spent
                        const FlSpot(30, 180), // Day 30 - $180 spent
                      ],
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.blue, // Fixed the color issue
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trust_guard/screens/debt.dart';
import 'package:trust_guard/screens/payment_screen.dart';
import 'package:trust_guard/widgets/NotificationsScreen.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';


import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
     LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Header with Notification Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back! AKHLAK',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Financial Summary Cards
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),

            // Payment Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payments',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const Text('Manage your bills', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Icon(Icons.payment, size: 32, color: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Loan/Debt Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.money_off, color: Colors.red),
                title: const Text(
                  'Outstanding Loan/Debt',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('\$1,200.00 - Due in 15 Days'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OutstandingLoanScreen()),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Pie Chart for Expense Distribution
            Text('Expense Breakdown', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 40, title: 'Rent'),
                    PieChartSectionData(color: Colors.green, value: 30, title: 'Food'),
                    PieChartSectionData(color: Colors.orange, value: 20, title: 'Transport'),
                    PieChartSectionData(color: Colors.red, value: 10, title: 'Others'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trust_guard/screens/debt.dart';
import 'package:trust_guard/screens/payment_screen.dart';
import 'package:trust_guard/widgets/NotificationsScreen.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Header with Notification Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back! AKHLAK',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Financial Summary Cards
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Payment Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payments',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const Text('Manage your bills', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Icon(Icons.payment, size: 32, color: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Loan/Debt Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.money_off, color: Colors.red),
                title: const Text(
                  'Outstanding Loan/Debt',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('\$1,200.00 - Due in 15 Days'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  OutstandingLoanScreen()),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Expense Breakdown Graph
            Text('Expense Breakdown', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 40, title: 'Rent'),
                    PieChartSectionData(color: Colors.green, value: 30, title: 'Food'),
                    PieChartSectionData(color: Colors.orange, value: 20, title: 'Transport'),
                    PieChartSectionData(color: Colors.red, value: 10, title: 'Others'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Earnings vs. Expenditure Graph
            Text('Earnings vs Expenditure', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(1, 100),
                        const FlSpot(2, 200),
                        const FlSpot(3, 150),
                        const FlSpot(4, 300),
                        const FlSpot(5, 250),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                    ),
                    LineChartBarData(
                      spots: [
                        const FlSpot(1, 80),
                        const FlSpot(2, 170),
                        const FlSpot(3, 120),
                        const FlSpot(4, 280),
                        const FlSpot(5, 230),
                      ],
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trust_guard/screens/debt.dart';
import 'package:trust_guard/screens/payment_screen.dart';
import 'package:trust_guard/widgets/NotificationsScreen.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back! AKHLAK',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payments',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const Text('Manage your bills', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Icon(Icons.payment, size: 32, color: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.money_off, color: Colors.red),
                title: const Text(
                  'Outstanding Loan/Debt',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('\$1,200.00 - Due in 15 Days'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OutstandingLoanScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text('Earnings vs Expenditure', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true, drawVerticalLine: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                  ),
                  borderData: FlBorderData(show: true, border: Border.all(color: Colors.black26, width: 1)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [const FlSpot(1, 100), const FlSpot(2, 200), const FlSpot(3, 150), const FlSpot(4, 300), const FlSpot(5, 250)],
                      isCurved: true,
                      color: Colors.blueAccent,
                      barWidth: 3,
                      belowBarData: BarAreaData(show: true, color: Colors.blueAccent.withOpacity(0.2)),
                    ),
                    LineChartBarData(
                      spots: [const FlSpot(1, 80), const FlSpot(2, 170), const FlSpot(3, 120), const FlSpot(4, 280), const FlSpot(5, 230)],
                      isCurved: true,
                      color: Colors.redAccent,
                      barWidth: 3,
                      belowBarData: BarAreaData(show: true, color: Colors.redAccent.withOpacity(0.2)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trust_guard/screens/debt.dart';
import 'package:trust_guard/screens/payment_screen.dart';
import 'package:trust_guard/widgets/NotificationsScreen.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Header with Notification Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back! AKHLAK',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Financial Summary Cards
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Payment Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payments',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const Text('Manage your bills', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Icon(Icons.payment, size: 32, color: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Pie Chart for Expense Distribution
            const SizedBox(height: 24),
            Text('Expense Breakdown', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 40, title: 'Rent'),
                    PieChartSectionData(color: Colors.green, value: 30, title: 'Food'),
                    PieChartSectionData(color: Colors.orange, value: 20, title: 'Transport'),
                    PieChartSectionData(color: Colors.red, value: 10, title: 'Others'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Earnings vs. Expenditure Graph
            Text('Earnings vs Expenditure', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(1, 100),
                        const FlSpot(2, 200),
                        const FlSpot(3, 150),
                        const FlSpot(4, 300),
                        const FlSpot(5, 250),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                    ),
                    LineChartBarData(
                      spots: [
                        const FlSpot(1, 80),
                        const FlSpot(2, 170),
                        const FlSpot(3, 120),
                        const FlSpot(4, 280),
                        const FlSpot(5, 230),
                      ],
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trust_guard/screens/debt.dart';
import 'package:trust_guard/screens/payment_screen.dart';
import 'package:trust_guard/widgets/NotificationsScreen.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';
import 'package:trust_guard/screens/chat_screen.dart'; // Import Chat Screen

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.chat, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Header with Notification Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back! AKHLAK',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Financial Summary Cards
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Payment Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payments',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const Text('Manage your bills', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Icon(Icons.payment, size: 32, color: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Pie Chart for Expense Distribution
            const SizedBox(height: 24),
            Text('Expense Breakdown', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 40, title: 'Rent'),
                    PieChartSectionData(color: Colors.green, value: 30, title: 'Food'),
                    PieChartSectionData(color: Colors.orange, value: 20, title: 'Transport'),
                    PieChartSectionData(color: Colors.red, value: 10, title: 'Others'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trust_guard/screens/debt.dart';
import 'package:trust_guard/screens/payment_screen.dart';
import 'package:trust_guard/widgets/NotificationsScreen.dart';
import 'package:trust_guard/widgets/leaderboard_screen.dart';
import 'package:trust_guard/widgets/settings_screen.dart';
import 'package:trust_guard/widgets/transactions_screen.dart';
import 'package:trust_guard/screens/chat_screen.dart'; // Import Chat Screen

import '../widgets/transaction_list_item.dart';
import '../widgets/dashboard_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const TransactionsScreen(),
    LeaderboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.chat, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Header with Notification Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back! AKHLAK',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Financial Summary Cards
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Expenses',
                    value: '\$2,459.50',
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Monthly Budget',
                    value: '\$5,000.00',
                    icon: Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Payment Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payments',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const Text('Manage your bills', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Icon(Icons.payment, size: 32, color: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Pie Chart for Expense Breakdown
            const SizedBox(height: 24),
            Text('Expense Breakdown', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 40, title: 'Rent'),
                    PieChartSectionData(color: Colors.green, value: 30, title: 'Food'),
                    PieChartSectionData(color: Colors.orange, value: 20, title: 'Transport'),
                    PieChartSectionData(color: Colors.red, value: 10, title: 'Others'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Earnings vs. Expenditure Graph
            Text('Earnings vs Expenditure', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    // Earnings Line
                    LineChartBarData(
                      spots: [
                        const FlSpot(1, 100),
                        const FlSpot(2, 200),
                        const FlSpot(3, 150),
                        const FlSpot(4, 300),
                        const FlSpot(5, 250),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                    ),
                    // Expenditure Line
                    LineChartBarData(
                      spots: [
                        const FlSpot(1, 80),
                        const FlSpot(2, 170),
                        const FlSpot(3, 120),
                        const FlSpot(4, 280),
                        const FlSpot(5, 230),
                      ],
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}













