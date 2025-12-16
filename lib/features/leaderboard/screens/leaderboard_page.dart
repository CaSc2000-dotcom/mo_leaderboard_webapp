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
  
  // State for data and search
  late Future<List<Entry>> _leaderboardFuture;
  List<Entry> _allEntries = []; // Store the full list here
  List<Entry> _filteredEntries = []; // Store the filtered list here
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _leaderboardFuture = _repository.getTopScores();
  }

  // Filter the list whenever text changes
  void _runFilter(String enteredKeyword) {
    List<Entry> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allEntries;
    } else {
      results = _allEntries
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredEntries = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 1000),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "TOP 50" Header
              Text("TOP 50", style: Theme.of(context).textTheme.displayLarge),
              
              const SizedBox(height: 20),

              // Search Bar
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => _runFilter(value),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "SEARCH USER...",
                    prefixIcon: const Icon(Icons.search, color: AppTheme.textMuted),
                    // Use the theme's input decoration but override specific needs if necessary
                    filled: true,
                    fillColor: AppTheme.surface,
                    isDense: true, 
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Data Loading & Table
              FutureBuilder<List<Entry>>(
                future: _leaderboardFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: AppTheme.neonGreen));
                  } else if (snapshot.hasError) {
                    return const Text("Failed to load scores.");
                  } 
                  
                  // Initialize lists once data is loaded
                  if (_allEntries.isEmpty && snapshot.hasData) {
                    _allEntries = snapshot.data!;
                    _filteredEntries = snapshot.data!;
                  }

                  if (_filteredEntries.isEmpty) {
                     return const Padding(
                       padding: EdgeInsets.only(top: 20.0),
                       child: Text("No players found."),
                     );
                  }

                  return LeaderboardTable(entries: _filteredEntries);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}