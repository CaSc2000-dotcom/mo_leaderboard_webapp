import 'package:flutter/material.dart';
import '../../../../shared/layouts/base_layout.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Text("LATEST NEWS", style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}