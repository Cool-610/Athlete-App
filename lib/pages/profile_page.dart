import 'package:flutter/material.dart';
import 'home_page.dart';


class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedTab = 'Overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey.shade300, width: 2),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(Icons.camera_alt, color: Colors.grey, size: 18),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.username,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Row(
                                  children: [
                                    Icon(Icons.location_on, size: 16, color: Colors.white70),
                                    SizedBox(width: 5),
                                    Text(
                                      "San Francisco, CA",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Member since March 2024",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.share, color: Colors.white, size: 24),
                            SizedBox(width: 15),
                            Icon(Icons.edit, color: Colors.white, size: 24),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTab("Overview", Icons.person),
                        _buildTab("History", Icons.history),
                        _buildTab("Achievements", Icons.emoji_events),
                        _buildTab("Mentors", Icons.people),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Main Content Section (changes based on selected tab)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildContentForTab(_selectedTab),
            ),
            // Account Settings Section (always visible)
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildAccountSettingsCard(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, IconData icon) {
    bool isSelected = _selectedTab == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white70,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 50,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  Widget _buildContentForTab(String tab) {
    switch (tab) {
      case 'Overview':
        return _buildOverviewContent();
      case 'History':
        return _buildHistoryContent();
      case 'Achievements':
        return _buildAchievementsContent();
      case 'Mentors':
        return _buildMentorsContent();
      default:
        return Container();
    }
  }

  Widget _buildOverviewContent() {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildInfoBox("24", "Tests Completed", Colors.blue.shade100, Colors.blue),
            _buildInfoBox("7", "Personal Bests", Colors.green.shade100, Colors.green),
            _buildInfoBox("15", "Day Streak", Colors.orange.shade100, Colors.orange),
            _buildInfoBox("#8", "Global Rank", Colors.purple.shade100, Colors.purple),
          ],
        ),
        const SizedBox(height: 20),
        _buildPerformanceOverviewCard(),
      ],
    );
  }

  Widget _buildAccountSettingsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
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
              Icon(Icons.settings, color: Colors.grey.shade700),
              const SizedBox(width: 8),
              const Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _buildSettingsItem("Edit Profile", Icons.settings),
          const SizedBox(height: 10),
          _buildSettingsItem("Privacy Settings", Icons.settings),
          const SizedBox(height: 10),
          _buildSettingsItem("Notification Preferences", Icons.settings),
          const SizedBox(height: 20),
          _buildSignOutButton(),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey.shade700),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          // Handle tap for each setting
          print('$title tapped!');
        },
      ),
    );
  }

  Widget _buildSignOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          // Add your sign-out logic here (e.g., clearing a token, auth state, etc.)
          print('User signed out.');

          // Navigate to HomePage and remove all previous routes
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (Route<dynamic> route) => false,
          );
        },
        icon: const Icon(Icons.logout, color: Colors.white),
        label: const Text(
          "Sign Out",
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade700,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryContent() {
    return Column(
      children: [
        _buildHistoryItem("Vertical Jump", "2024-09-09", "85", "24.5 inches", "+12%", Colors.blue),
        const SizedBox(height: 12),
        _buildHistoryItem("Push-up Test", "2024-09-08", "92", "42 reps", "+8%", Colors.green),
        const SizedBox(height: 12),
        _buildHistoryItem("Sprint Test", "2024-09-07", "76", "4.2 seconds", "-3%", Colors.red),
        const SizedBox(height: 12),
        _buildHistoryItem("Vertical Jump", "2024-09-05", "81", "23.1 inches", "+5%", Colors.blue),
      ],
    );
  }

  Widget _buildAchievementsContent() {
    return Column(
      children: [
        _buildAchievementCard("Consistency King", "Maintain 30-day streak", "August 12, 2024", "legendary", Colors.yellow.shade100),
        const SizedBox(height: 12),
        _buildAchievementCard("Speed Demon", "Top 10 in regional sprint ranking", "September 1, 2024", "epic", Colors.purple.shade100),
        const SizedBox(height: 12),
        _buildAchievementCard("Community Leader", "Help 10 other athletes", "September 5, 2024", "rare", Colors.blue.shade100),
        const SizedBox(height: 12),
        _buildAchievementCard("Rising Star", "Top 20% improvement in a month", "April 22, 2024", "rare", Colors.blue.shade100),
        const SizedBox(height: 12),
        _buildAchievementCard("Jump Master", "Achieve 24+ inch vertical jump", "June 8, 2024", "epic", Colors.purple.shade100),
      ],
    );
  }

  Widget _buildMentorsContent() {
    return Column(
      children: [
        _buildMentorCard("CM", "Michael Rayappan", "Speed Training", 12, "active"),
        const SizedBox(height: 12),
        _buildMentorCard("SC", "Prabhu", "Jump Technique", 0, "pending"),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Find New Mentor logic
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            animationDuration: Duration.zero,
            side: BorderSide.none,
            foregroundColor: Colors.white,
          ).copyWith(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              return Colors.transparent;
            }),
            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6A1B9A), Color(0xFF42A5F5)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              constraints: const BoxConstraints(minWidth: 88.0),
              alignment: Alignment.center,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.group, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Find New Mentor",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildInfoBox(String value, String label, Color bgColor, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: textColor.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceOverviewCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
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
              Icon(Icons.trending_up, color: Colors.green.shade600),
              const SizedBox(width: 8),
              const Text(
                "Performance Overview",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Overall Progress",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                "76th percentile",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.76,
              minHeight: 12,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPerformanceMetric("2456", "Total Score", Colors.blue),
              _buildPerformanceMetric("87%", "Improvement", Colors.green),
              _buildPerformanceMetric("4.8", "Avg Rating", Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetric(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(String testName, String date, String score, String details, String improvement, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.multiline_chart, color: color, size: 28),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        date,
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                score,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                details,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                improvement,
                style: TextStyle(
                  fontSize: 14,
                  color: improvement.contains('-') ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(String title, String description, String date, String rarity, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // This is a placeholder for the icon from the image
          Icon(
            rarity == 'legendary' ? Icons.emoji_events : (rarity == 'epic' ? Icons.bolt : Icons.star),
            size: 36,
            color: rarity == 'legendary' ? Colors.amber : (rarity == 'epic' ? Colors.purple : Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: rarity == 'legendary' ? Colors.yellow.shade200 : (rarity == 'epic' ? Colors.purple.shade200 : Colors.blue.shade200),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        rarity,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: rarity == 'legendary' ? Colors.yellow.shade800 : (rarity == 'epic' ? Colors.purple.shade800 : Colors.blue.shade800),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMentorCard(String initials, String name, String specialization, int sessions, String status) {
    Color statusColor = status == 'active' ? Colors.green : Colors.grey;
    Color initialsColor = name.startsWith('Michael') ? Colors.pink.shade400 : Colors.purple.shade400;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: initialsColor,
            child: Text(
              initials,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(specialization, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                Text("$sessions sessions", style: const TextStyle(fontSize: 12, color: Colors.black45)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.black87,
            ),
            child: Text(status == 'active' ? "Message" : "Accept"),
          ),
        ],
      ),
    );
  }
}