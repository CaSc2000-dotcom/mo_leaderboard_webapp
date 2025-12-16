import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/theme/app_theme.dart';
import 'features/home/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://ixgfzxmweunyfyfdtwvi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml4Z2Z6eG13ZXVueWZ5ZmR0d3ZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE2MTUxMTMsImV4cCI6MjA3NzE5MTExM30.5M3zeVhFsMUwDb1SuW4GKuAQY8ihoYqShIvNGbcTSgg',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Leaderboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(), // Start here
    );
  }
}