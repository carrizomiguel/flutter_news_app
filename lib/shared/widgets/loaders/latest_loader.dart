import 'package:flutter/material.dart';
import 'package:news/shared/shared.dart';

class LatestLoader extends StatelessWidget {
  const LatestLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      height: Layout.setHeight(context, 30),
      borderRadius: 10,
    );
  }
}
