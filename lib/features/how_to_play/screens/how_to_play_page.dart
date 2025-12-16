import 'package:flutter/material.dart';
import '../../../../shared/layouts/base_layout.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Text("HOW TO PLAY", style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}