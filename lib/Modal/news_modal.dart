class NewsModal {
  late List<Articles> articles;

  NewsModal({required this.articles});

  factory NewsModal.fromMap(Map m1) {
    return NewsModal(
        articles: (m1['articles'] as List)
            .map(
              (e) => Articles.fromMap(e),
        )
            .toList());
  }
}

class Articles {
  late String title, description, url, content, author, publishedAt, urlToImage;
  late Source source;

  Articles({
    required this.title,
    required this.description,
    required this.url,
    required this.content,
    required this.author,
    required this.publishedAt,
    required this.source,
    required this.urlToImage,
  });

  factory Articles.fromMap(Map m1) {
    return Articles(
      title: m1['title'] ?? 'No details right now',
      description: m1['description'] ??
          'It\'s almost time once again for the tech world to stop everything else it\'s doing and pay attention as a major company shows off its latest hardware. Next up is Google\'s turn at bat. Thanks to a string of leaks and Google’s own teases, we already have a prett…',
      url: m1['url'] ?? '',
      content: m1['content'] ?? '',
      author: m1['author'] ?? 'Google',
      publishedAt: m1['publishedAt'] ?? '2024-08-12T15:17:57Z',
      urlToImage: m1['urlToImage'] ??
          'https://contentstatic.techgig.com/photo/88607432/a-to-z-of-technology-top-tech-news-of-2021-at-a-glance.jpg?32786',
      source: Source.fromMap(m1['source']),
    );
  }
}

class Source {
  late String name;

  Source({required this.name});

  factory Source.fromMap(Map m1) {
    return Source(name: m1['name'] ?? 'Google');
  }
}
