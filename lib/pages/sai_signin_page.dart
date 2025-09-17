import 'package:flutter/material.dart';
import '../main.dart'; // Import MainPage

class SaiSignInPage extends StatefulWidget {
  const SaiSignInPage({super.key});

  @override
  State<SaiSignInPage> createState() => _SaiSignInPageState();
}

class _SaiSignInPageState extends State<SaiSignInPage> {
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
      appBar: AppBar(title: const Text("SAI Official Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
