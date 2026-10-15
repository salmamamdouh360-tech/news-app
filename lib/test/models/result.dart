class Result {
  final String title;
  final String? description;
  final String? imageUrl;
  final String? link;
  final String? sourceId;
  final String? pubDate;

  const Result({
    required this.title,
    this.description,
    this.imageUrl,
    this.link,
    this.sourceId,
    this.pubDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      title: json['title']?.toString() ?? 'No title',
      description: json['description']?.toString(),
      imageUrl: json['image_url']?.toString(),
      link: json['link']?.toString(),
      sourceId: json['source_id']?.toString(),
      pubDate: json['pubDate']?.toString(),
    );
  }
}
