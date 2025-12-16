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
      // Adjusted padding to align with row structure
      // 6.0 (Tab width) + 60.0 (Rank width) = ~66.0 offset
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 16), // Outer margin compensation
          SizedBox(
            width: 60, // Matches the Rank box width roughly
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text('RANK', style: Theme.of(context).textTheme.labelLarge),
            ),
          ),
          const SizedBox(width: 16), // Spacing between Rank and User
          Expanded(
            child: Text('USER', style: Theme.of(context).textTheme.labelLarge),
          ),
          SizedBox(
            width: 120,
            child: Text('SCORE', 
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelLarge
            ),
          ),
          const SizedBox(width: 16), // Outer margin compensation
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

  // Helper to get metallic gradients
  Gradient? _getTabGradient(int rank) {
    switch (rank) {
      case 1: // Gold
        return const LinearGradient(
          colors: [
            Color(0xFFFFF176), // Bright Yellow
            Color(0xFFFFD700), // Pure Gold
            Color(0xFFFFAB00), // Amber/Orange-Gold
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 2: // Silver
        return const LinearGradient(
          colors: [
            Color(0xFFF5F5F5), 
            Color(0xFFBDBDBD), 
            Color(0xFF757575)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 3: // Bronze
        return const LinearGradient(
          colors: [
            Color(0xFFD7CCC8), // Light Copper
            Color(0xFFA1887F), // Brownish
            Color(0xFF5D4037), // Dark Brown
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      default:
        return null; // No gradient for others
    }
  }

  @override
  Widget build(BuildContext context) {
    final gradient = _getTabGradient(rank);

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      height: 42, 
      clipBehavior: Clip.antiAlias, // Ensures the child containers respect the border radius
      decoration: BoxDecoration(
        color: AppTheme.surface, 
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          // Metallic Tab Strip
          Container(
            width: 6,
            decoration: BoxDecoration(
              gradient: gradient,
              // If no gradient (rank > 3), match the surface color or keep transparent
              color: gradient == null ? Colors.white.withValues(alpha: 0.08) : null,
            ),
          ),

          // Rank Box (Lighter Background)
          Container(
            width: 60,
            color: Colors.white.withValues(alpha: 0.08), // Slightly lighter than surface
            alignment: Alignment.center,
            child: Text(
              '$rank', // Removed the '#'
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          // User & Score Data
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Name
                  Expanded(
                    child: Text(
                      entry.name.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // Score
                  Text(
                    entry.score.toString(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppTheme.neonGreen,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}