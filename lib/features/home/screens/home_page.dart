import 'package:flutter/material.dart';
import '../../../../shared/layouts/base_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Text("HOME PAGE", style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}