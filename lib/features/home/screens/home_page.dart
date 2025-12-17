import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/layouts/base_layout.dart';
import '../../../../core/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        children: [
          // Large Hero Banner
          const _HeroBanner(),

          // Info & Screenshots
          const _GameInfoSection(),

          // Bottom CTA
          const _BottomCTA(),
        ],
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  const _HeroBanner();

  @override
  Widget build(BuildContext context) {
    // Calculate height to fill most of the screen (minus navbar approx)
    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight = (screenHeight * 0.85).clamp(500.0, 1000.0);

    return SizedBox(
      height: bannerHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // --- BACKGROUND GIF ---
          Container(
            color: Colors.black,
            child: Opacity(
              opacity: 0.4, // Darken the background so text pops
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF232930), Color(0xFF171818)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Image.asset( 
                    'assets/images/gameplay-gif.gif',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                ),
              ),
            ),
          ),
          
          // --- FOREGROUND TEXT ---
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "MERGE ONSLAUGHT",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 80, // Massive font size
                  shadows: [
                    const Shadow(
                      blurRadius: 20,
                      color: Colors.black,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GameInfoSection extends StatelessWidget {
  const _GameInfoSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          // Tagline
          Text(
            "DEFEND. MERGE. CONQUER.",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 40, 
              color: AppTheme.neonGreen
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 24),
          
          // Description
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              "MergeOnslaught is the ultimate endless hack and slash defense game. "
              "Run around with nothing but your sword and reflexes, surviving an onslaught "
              "of enemies. Climb the leaderboard by proving you're the best!",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                height: 1.6,
                color: AppTheme.textMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 60),

          // Screenshots Grid Placeholders
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Responsive: 3 columns on desktop, 1 on mobile
                int crossAxisCount = constraints.maxWidth > 900 ? 3 : 1;
                
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 16/9, // Standard screenshot ratio
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/images/screenshot_${index + 1}.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomCTA extends StatelessWidget {
  const _BottomCTA();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.background,
      padding: const EdgeInsets.only(bottom: 120, top: 40),
      child: Column(
        children: [
          Text(
            "READY TO JOIN THE BATTLE?",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          
          // Big Play Button
          ElevatedButton(
            onPressed: () async {
              final url = Uri.parse("https://casc2000-dotcom.github.io/MergeOnslaught/");
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            style: ElevatedButton.styleFrom(
              // Override default padding and text size for this specific button
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 28),
            ),
            child: Text(
              "PLAY NOW",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 24,
                color: Colors.black, // Ensure contrast on neon green
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}