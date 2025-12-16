import 'package:flutter/material.dart';
import '../../../../shared/layouts/base_layout.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/leaderboard_table.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final mockData = [
      Entry(name: "PRO_GAMER", score: 99950),
      Entry(name: "CAS_DEV", score: 85000),
      Entry(name: "PLAYER_1", score: 72400),
      Entry(name: "GUEST_99", score: 64000),
      Entry(name: "NOOB_MASTER", score: 12000),
    ];

    return BaseLayout(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800), // Limit width on large screens
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("LEADERBOARDS", style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 10),
              Text(
                "TOP PLAYERS THIS SEASON",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.neonGreen),
              ),
              const SizedBox(height: 40),
              LeaderboardTable(entries: mockData),
            ],
          ),
        ),
      ),
    );
  }
}