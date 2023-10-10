import 'package:flutter/material.dart';
import 'package:news/features/features.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        EverythingPage(),
        HeadlinePage(),
      ],
    );
  }
}
