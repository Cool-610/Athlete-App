import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Gradient Header
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.white, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Test Recording",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(height: 6),
                Text("Choose your assessment",
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                TestCard(
                  icon: Icons.show_chart,
                  iconColor: Colors.blue,
                  title: "Vertical Jump",
                  subtitle: "Measure your jumping height",
                  duration: "30 seconds",
                ),
                SizedBox(height: 12),
                TestCard(
                  icon: Icons.adjust,
                  iconColor: Colors.teal,
                  title: "Push-up Test",
                  subtitle: "Test your upper body strength",
                  duration: "60 seconds",
                ),
                SizedBox(height: 12),
                TestCard(
                  icon: Icons.bolt,
                  iconColor: Colors.green,
                  title: "Sprint Test",
                  subtitle: "Measure your speed and acceleration",
                  duration: "10 seconds",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TestCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String duration;

  const TestCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.timer, size: 16, color: Colors.black54),
              const SizedBox(width: 4),
              Text(duration,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }
}
