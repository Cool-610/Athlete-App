import 'package:flutter/material.dart';

enum RoleType { athlete, sai }

class RoleSelector extends StatelessWidget {
  final RoleType selectedRole;
  final Function(RoleType) onRoleSelected;

  const RoleSelector({
    super.key,
    required this.selectedRole,
    required this.onRoleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Your Role",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 24),

          _buildRoleBox(
            role: RoleType.athlete,
            color: Colors.orange,
            icon: Icons.show_chart,
            title: "Athlete",
            subtitle: "For talent assessment",
            isSelected: selectedRole == RoleType.athlete,
          ),
          const SizedBox(height: 16),

          _buildRoleBox(
            role: RoleType.sai,
            color: Colors.green,
            icon: Icons.shield,
            title: "SAI Official",
            subtitle: "For management and review",
            isSelected: selectedRole == RoleType.sai,
          ),
        ],
      ),
    );
  }

  Widget _buildRoleBox({
    required RoleType role,
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onRoleSelected(role),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
