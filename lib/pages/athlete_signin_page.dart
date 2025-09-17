import 'package:flutter/material.dart';
import '../main.dart'; // Import MainPage

class AthleteSignInPage extends StatefulWidget {
  const AthleteSignInPage({super.key});

  @override
  State<AthleteSignInPage> createState() => _AthleteSignInPageState();
}

class _AthleteSignInPageState extends State<AthleteSignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    String username = _usernameController.text.trim();

    if (username.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(username: username),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter username and password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ prevents overflow
      appBar: AppBar(title: const Text("Athlete Sign In")),
      body: SafeArea(
        child: SingleChildScrollView( // ✅ makes form scrollable when keyboard opens
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 80), // spacing from top
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _signIn,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Sign In"),
              ),
              const SizedBox(height: 40), // extra space so button not hidden
            ],
          ),
        ),
      ),
    );
  }
}
