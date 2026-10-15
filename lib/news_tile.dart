import 'package:flutter/material.dart';
import 'package:news_app/test/models/result.dart';

class NewsTile extends StatelessWidget {
  final Result article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 20, left: 12, right: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            article.imageUrl ?? 'https://placeholder.com',
            width: double.infinity,
            height: 210,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 210,
                width: double.infinity,
                color: Colors.grey[200],
                child: const Icon(
                  Icons.broken_image_rounded,
                  size: 50,
                  color: Colors.grey,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.source_rounded,
                      size: 16,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        article.pubDate != null
                            ? article.pubDate!.toString().substring(0, 10)
                            : 'Recent',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Text(
                  article.title ?? 'No Title Available',
                  maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  article.pubDate.toString(),
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
