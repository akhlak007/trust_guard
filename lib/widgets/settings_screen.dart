/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false;
      _notificationsEnabled = prefs.getBool('notifications') ?? true;
    });
  }

  Future<void> _savePreference(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.blueAccent),
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                  _savePreference('darkMode', value);
                });
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.orange),
            title: const Text("Enable Notifications"),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                  _savePreference('notifications', value);
                });
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.security, color: Colors.red),
            title: const Text("Privacy & Security"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy Screen (implement later)
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.green),
            title: const Text("Help & Support"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Help Screen (implement later)
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.grey),
            title: const Text("Log Out"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );// Handle logout action
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:trust_guard/providers/theme_provider.dart';
import 'package:trust_guard/widgets/theme_provider.dart';
import '../screens/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.blueAccent),
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.grey),
            title: const Text("Log Out"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:trust_guard/providers/theme_provider.dart';
import 'package:trust_guard/widgets/theme_provider.dart';
import '../screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications') ?? true;
    });
  }

  Future<void> _savePreference(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          // Dark Mode Toggle
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.blueAccent),
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),

          // Notifications Toggle
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.orange),
            title: const Text("Enable Notifications"),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                  _savePreference('notifications', value);
                });
              },
            ),
          ),

          const Divider(),

          // Privacy & Security
          ListTile(
            leading: const Icon(Icons.security, color: Colors.red),
            title: const Text("Privacy & Security"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy Screen (implement later)
            },
          ),

          // Help & Support
          ListTile(
            leading: const Icon(Icons.help, color: Colors.green),
            title: const Text("Help & Support"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Help Screen (implement later)
            },
          ),

          const Divider(),

          // Log Out
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.grey),
            title: const Text("Log Out"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}


