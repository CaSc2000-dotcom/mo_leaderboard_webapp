import 'package:flutter/rendering.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../widgets/leaderboard_table.dart';

class LeaderboardRepository {
  final SupabaseClient _client = Supabase.instance.client;

  // Fetch top 50 scores, ordered by highest score
  Future<List<Entry>> getTopScores() async {
    try {
      final response = await _client
          .from('leaderboard') // Make sure your table name is 'leaderboard' in Supabase
          .select('username, score') // Select specific columns
          .order('score', ascending: false)
          .limit(50);

      // Convert the List<Map> from Supabase into List<ArcadeEntry>
      final data = List<Map<String, dynamic>>.from(response);
      return data.map((row) => Entry(
        name: row['username'] as String,
        score: row['score'] as int,
      )).toList();
      
    } catch (e) {
      // Handle errors (like no internet) gracefully
      debugPrint('Error fetching leaderboard: $e');
      return []; // Return empty list on error
    }
  }
}