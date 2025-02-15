/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  // Sample leaderboard data
  final List<Map<String, dynamic>> leaderboardData = const [
    {"name": "Alice", "points": 980, "avatar": "A"},
    {"name": "Bob", "points": 870, "avatar": "B"},
    {"name": "Charlie", "points": 820, "avatar": "C"},
    {"name": "David", "points": 750, "avatar": "D"},
    {"name": "Eve", "points": 700, "avatar": "E"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leaderboard 🏆",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.purpleAccent.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: leaderboardData.length,
          itemBuilder: (context, index) {
            var player = leaderboardData[index];
            Color medalColor = _getMedalColor(index);

            return OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              closedElevation: 5,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              closedBuilder: (context, openContainer) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  color: Colors.white.withOpacity(0.9),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: medalColor,
                      child: Text(
                        player["avatar"],
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                    title: Text(
                      player["name"],
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "${player["points"]} Points",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      "#${index + 1}",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: medalColor,
                      ),
                    ),
                    onTap: openContainer,
                  ),
                );
              },
              openBuilder: (context, closeContainer) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text("${player["name"]}'s Profile"),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  body: Center(
                    child: Text(
                      "${player["name"]} has ${player["points"]} points!",
                      style: GoogleFonts.poppins(fontSize: 22),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // Function to assign colors based on ranking
  Color _getMedalColor(int index) {
    if (index == 0) return Colors.amber; // 🥇 Gold
    if (index == 1) return Colors.grey;  // 🥈 Silver
    if (index == 2) return Colors.brown; // 🥉 Bronze
    return Colors.deepPurpleAccent;      // Default color for others
  }
}*/
import 'package:flutter/material.dart';

void main() {
  runApp(LeaderboardScreen());
}

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Financial Management Leaderboard',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        dividerColor: Colors.white54,
      ),
      home: LeaderboardPage(),
    );
  }
}

class LeaderboardPage extends StatelessWidget {
  // Dummy data for the leaderboard entries.
  final List<LeaderboardEntry> entries = [
    LeaderboardEntry(rank: 1, userName: 'Alice', points: 1500, badge: 'Champion'),
    LeaderboardEntry(rank: 2, userName: 'Bob', points: 1400, badge: 'Pro Saver'),
    LeaderboardEntry(rank: 3, userName: 'Charlie', points: 1300, badge: 'Budget Guru'),
    LeaderboardEntry(rank: 4, userName: 'Diana', points: 1200, badge: 'Smart Spender'),
    LeaderboardEntry(rank: 5, userName: 'Evan', points: 1100, badge: 'Frugal Expert'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: entries.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final entry = entries[index];
            return ListTile(
              // Display the user's rank with a white circular badge.
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  entry.rank.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(entry.userName, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Points: ${entry.points} - ${entry.badge}'),
              // A fun icon reinforces the gamification aspect.
              trailing: Icon(Icons.emoji_events, color: Colors.amber),
              onTap: () {
                // This onTap event shows a snack bar with more details.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Viewing details for ${entry.userName}')),
                );
              },
            );
          },
        ),
      ),
      // A floating action button for refreshing the leaderboard or adding new functionalities.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.refresh, color: Colors.black),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Leaderboard refreshed')),
          );
        },
      ),
    );
  }
}

// Data model representing each leaderboard entry.
class LeaderboardEntry {
  final int rank;
  final String userName;
  final int points;
  final String badge;

  LeaderboardEntry({
    required this.rank,
    required this.userName,
    required this.points,
    required this.badge,
  });
}

