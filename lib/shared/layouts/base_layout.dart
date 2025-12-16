import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  
  // If I ever want a page without a footer (like a login screen)
  final bool showFooter; 

  const BaseLayout({
    super.key, 
    required this.child, 
    this.showFooter = true
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            
            // Ensures the child content takes up space naturally
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 200, // Minimal height to push footer down
              ),
              child: child,
            ),
            
            if (showFooter) const Footer(),
          ],
        ),
      ),
    );
  }
}