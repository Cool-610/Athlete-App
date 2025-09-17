import 'package:flutter/material.dart';
import '../widgets/role_selector.dart';
import 'athlete_signin_page.dart';
import 'sai_signin_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RoleType selectedRole = RoleType.athlete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Role Selector
          RoleSelector(
            selectedRole: selectedRole,
            onRoleSelected: (role) {
              setState(() {
                selectedRole = role;
              });
            },
          ),

          const SizedBox(height: 16),

          // Smooth Switching
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: selectedRole == RoleType.athlete
                  ? const AthleteSignInPage()
                  : const SaiSignInPage(),
            ),
          ),
        ],
      ),
    );
  }
}
