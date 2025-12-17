import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
// Pages
import '../../features/home/screens/home_page.dart';
import '../../features/leaderboard/screens/leaderboard_page.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  static void navigateTo(BuildContext context, Widget page) {
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
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          // Hamburger Menu for Mobile
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

          // Logo Area
          InkWell(
            onTap: () => navigateTo(context, const HomePage()),
            child: Row(
              children: [
                const Icon(Icons.castle, size: 40, color: AppTheme.textPrimary),
                const SizedBox(width: 8),
                // Hide text on extremely small screens if necessary
                if (MediaQuery.of(context).size.width > 400)
                  Text("MergeOnslaught", 
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24)),
              ],
            ),
          ),  
          
          const Spacer(),

          // Navigation Links (Desktop only)
          if (!isMobile) ...[
            _NavBarItem(title: "LEADERBOARDS", onTap: () => navigateTo(context, const LeaderboardPage())),
            const SizedBox(width: 40),
          ],

          // CTA Button - Always visible at top right
          const _PlayNowButton(),
        ],
      ),
    );
  }
}

class _PlayNowButton extends StatelessWidget {
  const _PlayNowButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppTheme.surface),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.castle, size: 50, color: AppTheme.neonGreen),
                SizedBox(height: 10),
                Text("NAVIGATION", style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          _DrawerItem(title: "LEADERBOARDS", page: const LeaderboardPage()),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final Widget page;
  const _DrawerItem({required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.textPrimary)),
      onTap: () => NavBar.navigateTo(context, page),
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