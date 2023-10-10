import 'package:flutter/material.dart';
import 'package:news/shared/shared.dart';

class ArticleLoader extends StatelessWidget {
  const ArticleLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        children: [
          ShimmerLoading(
            width: 100,
            height: 100,
            borderRadius: 8,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoading(
                  height: 12,
                ),
                SizedBox(height: 5),
                ShimmerLoading(
                  width: 100,
                  height: 12,
                ),
                Spacer(),
                ShimmerLoading(
                  height: 12,
                ),
                Spacer(),
                ShimmerLoading(
                  width: 140,
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
