import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

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
                "Leaderboard\nCompete and climb the ranks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Your Rank Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.purple.shade300,
                    child: const Text("A", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Rank", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("#8 in Overall", style: TextStyle(fontSize: 13, color: Colors.black54)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("2,456", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
                      Row(
                        children: [
                          const Icon(Icons.show_chart, color: Colors.green, size: 16),
                          const SizedBox(width: 4),
                          Text("+18 pts", style: TextStyle(fontSize: 13, color: Colors.green.shade700)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Leaderboard Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.emoji_events, color: Colors.amber),
                      SizedBox(width: 8),
                      Text("Leaderboard", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Tab-like buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildLeaderboardTab("Overall", true),
                      _buildLeaderboardTab("Jump", false),
                      _buildLeaderboardTab("Push-ups", false),
                      _buildLeaderboardTab("Sprint", false),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  // List of rankings
                  _buildRankingItemCard(1, "SC", "Sarah Chen", "California", 2847, 15, Colors.amber.shade700),
                  _buildRankingItemCard(2, "AR", "Alex Rodriguez", "Texas", 2756, 12, Colors.blueGrey),
                  _buildRankingItemCard(3, "JS", "Jordan Smith", "New York", 2698, 8, Colors.brown),
                  _buildRankingItemCard(4, "MP", "Maya Patel", "Florida", 2645, 6, null),
                  _buildRankingItemCard(5, "CJ", "Chris Johnson", "California", 2589, 3, null),
                  const SizedBox(height: 8),
                  _buildRankingItemCard(8, "YO", "You (Alex)", "Local", 2456, -18, Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Active Challenges Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.flash_on, color: Colors.orange),
                    SizedBox(width: 8),
                    Text("Active Challenges", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildChallengeCard(
                  icon: Icons.track_changes,
                  iconColor: Colors.blue.shade600,
                  title: "Weekly Jump Challenge",
                  description: "Best vertical jump this week",
                  rewardText: "50 XP",
                  participants: 234,
                  daysLeft: 3,
                ),
                _buildChallengeCard(
                  icon: Icons.flash_on,
                  iconColor: Colors.red.shade600,
                  title: "Push-up Marathon",
                  description: "Most push-ups in 60 seconds",
                  rewardText: "Bronze Badge",
                  participants: 189,
                  daysLeft: 5,
                ),
                _buildChallengeCard(
                  icon: Icons.military_tech,
                  iconColor: Colors.purple.shade600,
                  title: "Regional Sprint Cup",
                  description: "Fastest sprint in your region",
                  rewardText: "Regional Champion",
                  participants: 156,
                  daysLeft: 1,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Your Achievements Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.emoji_events, color: Colors.purple),
                    SizedBox(width: 8),
                    Text("Your Achievements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.0, // Adjust as needed for aspect ratio
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    _buildAchievementBadgeCard(
                      icon: Icons.star,
                      iconColor: Colors.amber,
                      title: "Rising Star",
                      subtitle: "Top 20% improvement",
                      tag: "common",
                      tagColor: Colors.grey.shade400,
                      tagTextColor: Colors.black87,
                    ),
                    _buildAchievementBadgeCard(
                      icon: Icons.flash_on,
                      iconColor: Colors.orange,
                      title: "Speed Demon",
                      subtitle: "Top 10 in sprint",
                      tag: "rare",
                      tagColor: Colors.blue.shade200,
                      tagTextColor: Colors.blue.shade800,
                    ),
                    _buildAchievementBadgeCard(
                      icon: Icons.fitness_center, // Using fitness_center for jump
                      iconColor: Colors.brown.shade400,
                      title: "Jump Master",
                      subtitle: "Personal best jump",
                      tag: "epic",
                      tagColor: Colors.purple.shade200,
                      tagTextColor: Colors.purple.shade800,
                    ),
                    _buildAchievementBadgeCard(
                      icon: Icons.access_time, // Using access_time for streak
                      iconColor: Colors.orange.shade300,
                      title: "Consistency King",
                      subtitle: "30-day streak",
                      tag: "legendary",
                      tagColor: Colors.yellow.shade200,
                      tagTextColor: Colors.orange.shade800,
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

  static Widget _buildLeaderboardTab(String title, bool isSelected) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? Colors.black : Colors.black54,
      ),
    );
  }

  static Widget _buildRankingItemCard(
      int rank, String initials, String name, String location, int score, int change, Color? badgeColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: badgeColor != null ? badgeColor.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: badgeColor != null ? Border.all(color: badgeColor, width: 2) : null,
      ),
      child: Row(
        children: [
          Icon(
            rank == 1
                ? Icons.emoji_events
                : rank == 2
                    ? Icons.military_tech
                    : rank == 3
                        ? Icons.local_fire_department
                        : Icons.star_border,
            color: badgeColor,
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: badgeColor ?? Colors.grey.shade400,
            child: Text(initials, style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(location, style: const TextStyle(fontSize: 13, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(score.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 2),
              Text(
                (change >= 0 ? "+$change" : "$change") + " pts",
                style: TextStyle(
                  fontSize: 13,
                  color: change >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildChallengeCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String rewardText,
    required int participants,
    required int daysLeft,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.1),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  rewardText,
                  style: TextStyle(color: iconColor, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.group, size: 16, color: Colors.black54),
              const SizedBox(width: 4),
              Text("$participants participants", style: const TextStyle(fontSize: 13, color: Colors.black54)),
              const SizedBox(width: 16),
              const Icon(Icons.timer, size: 16, color: Colors.black54),
              const SizedBox(width: 4),
              Text("$daysLeft days left", style: const TextStyle(fontSize: 13, color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              onPressed: () {
                // Handle join challenge action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Make button background transparent to show gradient
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Join Challenge",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildAchievementBadgeCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String tag,
    required Color tagColor,
    required Color tagTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: iconColor),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: tagColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tag,
              style: TextStyle(color: tagTextColor, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}