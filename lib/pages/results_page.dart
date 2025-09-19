import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF007BFF), Color(0xFF00D084)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: const Text(
                "Results & Analytics\nTrack your progress and performance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Performance Overview
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Performance Overview",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ToggleButtons(
                  isSelected: const [false, true, false],
                  onPressed: (index) {},
                  borderRadius: BorderRadius.circular(8),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("Week"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("Month"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("Year"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Stats Grid
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.6,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildStatCard("84", "Average Score", "+6%"),
                _buildStatCard("76", "Percentile Rank", "+12%"),
                _buildStatCard("24", "Tests Completed", "+8"),
                _buildStatCard("7", "Personal Bests", "+2"),
              ],
            ),
            const SizedBox(height: 20),

            // Latest Test Result
            const Text(
              "Latest Test Result",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Vertical Jump",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("24.5 inches"),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Score",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      Text("85",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text("Percentile Ranking"),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: 0.78,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.green,
                    minHeight: 8,
                  ),
                  const SizedBox(height: 6),
                  const Text("78th percentile"),
                  const SizedBox(height: 8),
                  const Text(
                    "Improvement from last test  +12%",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recent Tests Section
            const Text(
              "Recent Tests",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                _buildRecentTestCard("Vertical Jump", "2024-09-09", "24.5 inches", 85, 12),
                _buildRecentTestCard("Push-up Test", "2024-09-08", "42 reps", 92, 8),
                _buildRecentTestCard("Sprint Test", "2024-09-07", "4.2 seconds", 76, -3),
                _buildRecentTestCard("Vertical Jump", "2024-09-05", "23.1 inches", 81, 5),
              ],
            ),
            const SizedBox(height: 20),

            // Recent Achievements Section
            const Text(
              "Recent Achievements",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                _buildAchievementCard("Personal Best", "New record in Vertical Jump!", "New", Colors.orange),
                _buildAchievementCard("Hot Streak", "5 consecutive improvements", "Streak", Colors.purple),
                _buildAchievementCard("Top Performer", "Top 20% in your age group", "Elite", Colors.blue),
              ],
            ),
            const SizedBox(height: 20),

            // New Test & Filter Results Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle 'New Test' action
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.flash_on, size: 24),
                        const SizedBox(width: 8),
                        const Text("New Test", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle 'Filter Results' action
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.green.shade600, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      foregroundColor: Colors.green.shade600,
                      shadowColor: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.filter_alt, size: 24),
                        const SizedBox(width: 8),
                        const Text("Filter Results", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper for stat cards
  static Widget _buildStatCard(String value, String label, String change) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 6),
          Text(change, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  // Helper for recent tests
  static Widget _buildRecentTestCard(String title, String date, String result, int score, int change) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.shade300,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.show_chart, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(date, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                const SizedBox(height: 2),
                Text(result),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$score", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 2),
              Text(
                (change >= 0 ? "↑ $change%" : "↓ ${-change}%"),
                style: TextStyle(color: change >= 0 ? Colors.green : Colors.red, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper for achievements
  static Widget _buildAchievementCard(String title, String subtitle, String badge, Color badgeColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: badgeColor,
            child: const Icon(Icons.emoji_events, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(badge, style: TextStyle(color: badgeColor, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}