import 'package:flutter/material.dart';
import '../widgets/role_selector.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/header_section.dart';
import '../widgets/footer_section.dart';
import '../utils/constants.dart';

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
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        // The SingleChildScrollView allows the content to scroll
        // when the keyboard appears, preventing pixel overflow.
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              const HeaderSection(),
              const SizedBox(height: 40),
              const Text(
                "Select Your Role",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              RoleSelector(
                selectedRole: selectedRole,
                onRoleSelected: (role) {
                  setState(() {
                    selectedRole = role;
                  });
                },
              ),
              const SizedBox(height: 24),
              SignInForm(selectedRole: selectedRole),
              const SizedBox(height: 24),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}