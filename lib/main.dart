import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'shared/layouts/base_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MergeOnslaught Leaderboards',
      theme: AppTheme.darkTheme,
      home: BaseLayout(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("TOP 500", style: AppTheme.darkTheme.textTheme.displayLarge),
              const SizedBox(height: 20),
              const Text("Leaderboard Table Coming Soon..."),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
