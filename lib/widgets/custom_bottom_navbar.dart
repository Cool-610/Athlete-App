import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, "मुख्य", "Home", 0),
          _buildNavItem(Icons.videocam, "परीक्षा", "Test", 1),
          _buildNavItem(Icons.bar_chart, "परिणाम", "Results", 2),
          _buildNavItem(Icons.emoji_events, "रैंकिंग", "Ranking", 3),
          _buildNavItem(Icons.notifications, "सूचना", "Alerts", 4),
          _buildNavItem(Icons.person, "प्रोफाइल", "Profile", 5),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String hindi, String english, int index) {
    final isSelected = index == currentIndex;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 22,
                color: isSelected ? Colors.orange : Colors.grey.shade600,
              ),
              const SizedBox(height: 2),
              Text(
                "$hindi /",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.orange : Colors.grey.shade600,
                ),
              ),
              Text(
                english,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.orange : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
