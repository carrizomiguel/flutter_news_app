import 'package:flutter/material.dart';
import 'package:news/shared/shared.dart';

class HomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: TabBar(
        padding: EdgeInsets.only(bottom: 15),
        dividerColor: Colors.white,
        tabs: [
          _TabItem(title: 'Everything'),
          _TabItem(title: 'Top Headlines'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Layout.setWidth(context, 100),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
