import 'package:flutter/material.dart';

// Enum to represent the type of notification for filtering
enum NotificationType {
  all,
  unread,
  achievements,
  challenges,
}

// Data model for a single notification item
class NotificationItem {
  final String title;
  final String content;
  final String time;
  final NotificationType type;
  final IconData icon;
  final Color iconColor;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.content,
    required this.time,
    required this.type,
    required this.icon,
    required this.iconColor,
    this.isRead = false,
  });
}

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  _AlertsPageState createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  // A list of all notifications
  final List<NotificationItem> _allNotifications = [
    NotificationItem(
      title: "New Personal Best!",
      content: "You just set a new record in Vertical Jump: 24.5 inches",
      time: "2 hours ago",
      type: NotificationType.achievements,
      icon: Icons.emoji_events,
      iconColor: Colors.amber,
      isRead: false,
    ),
    NotificationItem(
      title: "Weekly Challenge Complete",
      content: "Congratulations! You completed the Push-up Challenge",
      time: "5 hours ago",
      type: NotificationType.challenges,
      icon: Icons.check_circle_outline,
      iconColor: Colors.green,
      isRead: false,
    ),
    NotificationItem(
      title: "Milestone Reached",
      content: "You've completed 25 tests! Keep it up!",
      time: "1 week ago",
      type: NotificationType.achievements,
      icon: Icons.star,
      iconColor: Colors.pink,
      isRead: true,
    ),
    NotificationItem(
      title: "New Badge Earned",
      content: "You earned the \"Consistency Champion\" badge",
      time: "3 days ago",
      type: NotificationType.achievements,
      icon: Icons.military_tech,
      iconColor: Colors.purple,
      isRead: true,
    ),
    NotificationItem(
      title: "Test Reminder",
      content: "Don't forget to complete your Sprint Test today",
      time: "1 day ago",
      type: NotificationType.challenges,
      icon: Icons.calendar_today,
      iconColor: Colors.blue,
      isRead: true,
    ),
    NotificationItem(
      title: "New Follower",
      content: "Sarah Chen is now following your progress",
      time: "1 day ago",
      type: NotificationType.all,
      icon: Icons.people,
      iconColor: Colors.purple,
      isRead: true,
    ),
    NotificationItem(
      title: "Performance Insights",
      content: "Your jump height improved by 15% this month!",
      time: "2 days ago",
      type: NotificationType.all,
      icon: Icons.show_chart,
      iconColor: Colors.orange,
      isRead: true,
    ),
    NotificationItem(
      title: "Challenge Invitation",
      content: "Alex Rodriguez challenged you to a Sprint Test",
      time: "4 days ago",
      type: NotificationType.challenges,
      icon: Icons.flash_on,
      iconColor: Colors.red,
      isRead: true,
    ),
  ];

  NotificationType _selectedFilter = NotificationType.all;

  void _markAsRead(NotificationItem item) {
    setState(() {
      if (!item.isRead) {
        item.isRead = true;
      }
    });
  }

  void _deleteNotification(NotificationItem item) {
    final originalIndex = _allNotifications.indexOf(item);
    if (originalIndex != -1) {
      setState(() {
        _allNotifications.removeAt(originalIndex);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Notification deleted"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  List<NotificationItem> get _filteredNotifications {
    switch (_selectedFilter) {
      case NotificationType.all:
        return _allNotifications;
      case NotificationType.unread:
        return _allNotifications.where((item) => !item.isRead).toList();
      case NotificationType.achievements:
        return _allNotifications.where((item) => item.type == NotificationType.achievements).toList();
      case NotificationType.challenges:
        return _allNotifications.where((item) => item.type == NotificationType.challenges).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount = _allNotifications.where((item) => !item.isRead).length;
    final achievementsCount = _allNotifications.where((item) => item.type == NotificationType.achievements).length;
    final challengesCount = _allNotifications.where((item) => item.type == NotificationType.challenges).length;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Notifications\nStay updated on your progress",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                ),
                Icon(Icons.notifications, color: Colors.white, size: 28),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Top buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        for (var item in _allNotifications) {
                          item.isRead = true;
                        }
                      });
                    },
                    icon: Icon(Icons.check_circle_outline, color: Colors.blue.shade600),
                    label: Text("Mark All Read", style: TextStyle(color: Colors.blue.shade600)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade50,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle settings action
                    },
                    icon: Icon(Icons.settings, color: Colors.grey.shade600),
                    label: Text("Settings", style: TextStyle(color: Colors.grey.shade600)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Filter Buttons with Horizontal Scroller
          SizedBox(
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildFilterButton("All", NotificationType.all, _allNotifications.length),
                  const SizedBox(width: 8),
                  _buildFilterButton("Unread", NotificationType.unread, unreadCount),
                  const SizedBox(width: 8),
                  _buildFilterButton("Achievements", NotificationType.achievements, achievementsCount),
                  const SizedBox(width: 8),
                  _buildFilterButton("Challenges", NotificationType.challenges, challengesCount),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Notifications List and Preferences section integrated into a single scrollable list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredNotifications.length + 1, // Add 1 for the preferences section
              itemBuilder: (context, index) {
                if (index < _filteredNotifications.length) {
                  // It's a notification card
                  final item = _filteredNotifications[index];
                  return _buildNotificationCard(context, item);
                } else {
                  // It's the notification preferences section
                  return _buildNotificationPreferencesSection();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, NotificationType type, int count) {
    final isSelected = _selectedFilter == type;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedFilter = type;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        elevation: 0,
      ),
      child: Row(
        children: [
          Text(text),
          if (count > 0)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(BuildContext context, NotificationItem item) {
    return Dismissible(
      key: ValueKey(item),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _deleteNotification(item);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: GestureDetector(
        onTap: () {
          _markAsRead(item);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Notification icon and container
              CircleAvatar(
                backgroundColor: item.iconColor.withOpacity(0.1),
                child: Icon(item.icon, color: item.iconColor),
              ),
              const SizedBox(width: 12),
              // Main content (title, content, time)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        if (!item.isRead)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _deleteNotification(item);
                          },
                          child: const Icon(Icons.delete_outline, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.content,
                      style: const TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.time,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    if (item.title == "Challenge Invitation")
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.grey.shade600,
                                  side: BorderSide(color: Colors.grey.shade400),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text("Decline"),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text("Accept"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (item.title == "Test Reminder")
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text("Take Test"),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationPreferencesSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.settings, color: Colors.black),
              SizedBox(width: 8),
              Text(
                "Notification Preferences",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildPreferenceRow(
            "Push Notifications",
            "Get alerts on your device",
            () {
              // Handle configure for Push Notifications
            },
          ),
          const Divider(),
          _buildPreferenceRow(
            "Email Summaries",
            "Weekly progress reports",
            () {
              // Handle configure for Email Summaries
            },
          ),
          const Divider(),
          _buildPreferenceRow(
            "Achievement Alerts",
            "Celebrate your wins",
            () {
              // Handle configure for Achievement Alerts
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPreferenceRow(String title, String subtitle, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text("Configure"),
          ),
        ],
      ),
    );
  }
}