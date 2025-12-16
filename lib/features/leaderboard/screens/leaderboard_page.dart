import 'package:flutter/material.dart';
import '../../../../shared/layouts/base_layout.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/leaderboard_table.dart';
import '../data/leaderboard_repository.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}
class _LeaderboardPageState extends State<LeaderboardPage> {
  final LeaderboardRepository _repository = LeaderboardRepository();
  late Future<List<Entry>> _leaderboardFuture;

  @override
  void initState() {
    super.initState();
    _leaderboardFuture = _repository.getTopScores();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("LEADERBOARD", style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 10),
              Text(
                "TOP PLAYERS",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.neonGreen),
              ),
              const SizedBox(height: 40),

              // Use FutureBuilder to handle the async data fetching
              FutureBuilder<List<Entry>>(
                future: _leaderboardFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(color: AppTheme.neonGreen);
                  } else if (snapshot.hasError) {
                    return const Text("Failed to load scores. Check internet connection.");
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text("No scores yet. Be the first!");
                  }

                  return LeaderboardTable(entries: snapshot.data!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}