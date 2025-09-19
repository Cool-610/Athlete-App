import 'package:flutter/material.dart';
import 'package:athletiqapp/utils/constants.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildRoleBox(
          role: RoleType.athlete,
          color: kOrangeGradient.colors.first,
          icon: Icons.show_chart_rounded,
          title: "Athlete",
          subtitle: "For talent assessment",
          isSelected: selectedRole == RoleType.athlete,
        ),
        const SizedBox(height: 16),
        _buildRoleBox(
          role: RoleType.sai,
          color: kGreenGradient.colors.first,
          icon: Icons.shield,
          title: "SAI Official",
          subtitle: "For management & review",
          isSelected: selectedRole == RoleType.sai,
        ),
      ],
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? kOrangeGradient.colors.first : Colors.grey.shade300,
            width: isSelected ? 2.5 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected ? [
            BoxShadow(
              color: kOrangeGradient.colors.first.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ] : [],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
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