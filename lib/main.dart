import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:athletiqapp/firebase_options.dart'; // Import the generated file

import 'pages/home_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/test_page.dart';
import 'pages/results_page.dart';
import 'pages/ranking_page.dart';
import 'pages/alerts_page.dart';
import 'pages/profile_page.dart';
import 'widgets/custom_bottom_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const HomePage(),
    );
  }
}

class MainPage extends StatefulWidget {
  final String username;
  final int initialIndex;

  const MainPage({
    super.key,
    required this.username,
    this.initialIndex = 0,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;

    _pages = [
      DashboardPage(
        username: widget.username,
        onNavigateToTest: (index) => _onItemTapped(index),
      ),
      const TestPage(),
      const ResultsPage(),
      const RankingPage(),
      const AlertsPage(),
      ProfilePage(username: widget.username),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}