import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Darker than surface
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Divider(color: AppTheme.surface, thickness: 1),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Copyright Text
              Text(
                "© 2025 MERGEONSLAUGHT. ALL RIGHTS RESERVED.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textMuted, 
                  fontSize: 12
                ),
              ),
              
              const Row(
                children: [
                  // Social Placeholders
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}