import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/shared/shared.dart';
import 'package:news_api/news_api.dart';

class LatestItem extends StatelessWidget {
  const LatestItem({
    required this.item,
    super.key,
  });

  final Article item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        width: double.infinity,
        height: Layout.setHeight(context, 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: item.urlToImage == null
                ? const AssetImage(
                    'assets/not_found.jpg',
                  ) as ImageProvider
                : NetworkImage(
                    item.urlToImage!,
                  ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: Layout.setHeight(context, 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: const Text(
                      'Latest News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        DateFormat.MMMMEEEEd().format(item.publishedAt),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const Text(
                        ' | ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        item.source.name,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
