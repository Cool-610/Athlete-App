import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/test_page.dart';
import 'pages/results_page.dart';
import 'pages/ranking_page.dart';
import 'pages/alerts_page.dart';
import 'pages/profile_page.dart';
import 'widgets/custom_bottom_navbar.dart';

void main() {
  runApp(const AthletiqApp());
}

class AthletiqApp extends StatelessWidget {
  const AthletiqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Athletiq',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(), // first screen is login/role selection
    );
  }
}

/// Main page with bottom navigation
class MainPage extends StatefulWidget {
  final String username; // passed from login page

  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      DashboardPage(username: widget.username),
      const TestPage(),
      const ResultsPage(),
      const RankingPage(),
      const AlertsPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
