import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
// Pages
import '../../features/home/screens/home_page.dart';
import '../../features/news/screens/news_page.dart';
import '../../features/leaderboard/screens/leaderboard_page.dart';
import '../../features/how_to_play/screens/how_to_play_page.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => page,
        transitionDuration: Duration.zero, // Instant switch like a website
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          // Logo Area
          InkWell(
            onTap: () => _navigateTo(context, const HomePage()),
            child: Row(
              children: [
                const Icon(Icons.castle, size: 40, color: AppTheme.textPrimary),
                const SizedBox(width: 8),
                Text("MergeOnslaught", style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24)),
              ],
            ),
          ),  
          
          const Spacer(),

          // Navigation Links (Desktop view)
          // TODO: Make these their own widgets with hover effects
          _NavBarItem(title: "NEWS", onTap: () => _navigateTo(context, const NewsPage())),
          _NavBarItem(title: "LEADERBOARDS", onTap: () => _navigateTo(context, const LeaderboardPage())),
          _NavBarItem(title: "HOW TO PLAY", onTap: () => _navigateTo(context, const HowToPlayPage())),

          const SizedBox(width: 40),

          // CTA Button
          ElevatedButton(
            onPressed: () async {
              final url = Uri.parse("https://casc2000-dotcom.github.io/MergeOnslaught/");
              if (await canLaunchUrl(url)) {
                await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            child: const Text("PLAY NOW"),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppTheme.textMuted,
          ),
        ),
      ),
    );
  }
}