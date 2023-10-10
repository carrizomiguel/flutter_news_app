import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    required this.height,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 0,
    super.key,
  });

  final double? width;
  final double height;
  final EdgeInsetsGeometry margin;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade300.withOpacity(.8),
        child: Container(
          margin: margin,
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
