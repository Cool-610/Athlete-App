import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green.shade400,
              child: const Icon(Icons.show_chart, color: Colors.white),
            ),
            const SizedBox(width: 20),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade800,
              child: const Text(
                'IN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "Sports Talent Assessment",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFFE47012),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Sports Authority of India",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        const Text(
          "Ministry of Youth Affairs and Sports",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}