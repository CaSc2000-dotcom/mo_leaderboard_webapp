import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';

// Simple model for your Arcade Entry
class Entry {
  final String name;
  final int score;

  Entry({required this.name, required this.score});
}

class LeaderboardTable extends StatelessWidget {
  final List<Entry> entries;

  const LeaderboardTable({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Container(
      // The container gives the table a "Card" look on the dark background
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppTheme.surface, 
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          // The Header
          const _HeaderRow(),
          
          // Scrollable List
          ListView.builder(
            shrinkWrap: true, // Important since this is inside a Column
            physics: const NeverScrollableScrollPhysics(), // Let the outer page scroll
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              // Pass (index + 1) as the rank
              return _PlayerRow(
                rank: index + 1, 
                entry: entry, 
                isEven: index % 2 == 0
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.neonGreen, width: 2)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60, 
            child: Text('RANK', style: Theme.of(context).textTheme.labelLarge)
          ),
          Expanded(
            child: Text('PLAYER', style: Theme.of(context).textTheme.labelLarge)
          ),
          SizedBox(
            width: 100,
            child: Text('SCORE', 
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelLarge
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerRow extends StatelessWidget {
  final int rank;
  final Entry entry;
  final bool isEven;

  const _PlayerRow({
    required this.rank,
    required this.entry,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    // Determine Rank Color
    Color rankColor = AppTheme.textMuted;
    if (rank == 1) {rankColor = const Color(0xFFFFD700);} // Gold
    else if (rank == 2) {rankColor = const Color(0xFFC0C0C0);} // Silver
    else if (rank == 3) {rankColor = const Color(0xFFCD7F32);} // Bronze

    // Determine Background (Zebra Striping)
    // If it's an even row, use the surface color. If odd, use a slightly lighter row color.
    final backgroundColor = isEven ? AppTheme.surface : AppTheme.tableRowEven;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // RANK COLUMN
          SizedBox(
            width: 60,
            child: Text(
              '#$rank',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: rankColor,
                fontWeight: rank <= 3 ? FontWeight.bold : FontWeight.normal,
                fontSize: rank <= 3 ? 18 : 16, // Make top 3 pop a bit more
              ),
            ),
          ),
          
          // NAME COLUMN
          Expanded(
            child: Text(
              entry.name.toUpperCase(), // Arcade names are usually uppercase
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: rank <= 3 ? Colors.white : AppTheme.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // SCORE COLUMN (Monospace font for number alignment)
          SizedBox(
            width: 100,
            child: Text(
              entry.score.toString(),
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppTheme.neonGreen, // Highlight the score in neon
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}