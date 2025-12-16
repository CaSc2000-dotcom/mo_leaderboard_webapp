import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';

// Simple model for Entry
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
    return Column(
      children: [
        // Header Row
        const _HeaderRow(),
        const SizedBox(height: 10),
        
        // List of Rows
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            return _PlayerRow(
              rank: index + 1,
              entry: entries[index],
            );
          },
        ),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text('RANK', style: Theme.of(context).textTheme.labelLarge)
          ),
          Expanded(
            child: Text('PLAYER', style: Theme.of(context).textTheme.labelLarge)
          ),
          SizedBox(
            width: 120,
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

  const _PlayerRow({
    required this.rank,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    // Determine Tab Color
    Color tabColor = Colors.transparent; // Default invisible
    if (rank == 1) {tabColor = const Color(0xFFFFD700);} // Gold
    else if (rank == 2) {tabColor = const Color(0xFFC0C0C0);} // Silver
    else if (rank == 3) {tabColor = const Color(0xFFCD7F32);} // Bronze

    return Container(
      // Add Spacing between rows
      margin: const EdgeInsets.only(bottom: 8), 
      
      // Decoration: Surface Color + Left Border Tab
      decoration: BoxDecoration(
        color: AppTheme.surface, // Solid card color
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4),
          // Left side is flat for the tab look
        ),
        border: Border(
          left: BorderSide(
            color: tabColor, 
            width: 6, // Thickness of the "Tab"
          ),
        ),
      ),
      
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      
      child: Row(
        children: [
          // RANK
          SizedBox(
            width: 60,
            child: Text(
              '#$rank',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textMuted,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // NAME
          Expanded(
            child: Text(
              entry.name.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white, // Standard white text
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          // SCORE
          SizedBox(
            width: 120,
            child: Text(
              entry.score.toString(),
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppTheme.neonGreen, 
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}