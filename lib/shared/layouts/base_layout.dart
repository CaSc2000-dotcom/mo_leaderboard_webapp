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
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 200, 
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