import 'package:flutter/material.dart';
import '../widgets/role_selector.dart';
import '../utils/gradient_button.dart';
import '../main.dart'; // Import MainPage
import '../utils/constants.dart';

class SignInForm extends StatefulWidget {
  final RoleType selectedRole;

  const SignInForm({super.key, required this.selectedRole});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _signIn() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(username: email),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isAthlete = widget.selectedRole == RoleType.athlete;

    return Column(
      children: [
        TextField(
          controller: _emailController,
          focusNode: _emailFocusNode,
          decoration: InputDecoration(
            hintText: "Email address",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 24),
        GradientButton(
          onPressed: _signIn,
          gradient: isAthlete ? kOrangeGradient : kGreenGradient,
          label: "Sign In",
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            // Handle sign up navigation
          },
          child: Text(
            "Don't have an account? Sign up",
            style: TextStyle(
              color: isAthlete ? kOrangeGradient.colors.first : kGreenGradient.colors.first,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}