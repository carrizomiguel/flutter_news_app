class Source {
  const Source({
    required this.id,
    required this.name,
    this.description = '',
    this.url = '',
    this.category = '',
    this.language = '',
    this.country = '',
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      category: json['category'] as String,
      language: json['language'] as String,
      country: json['country'] as String,
    );
  }

  factory Source.fromArticle(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String,
    );
  }

  final String? id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'language': language,
      'country': country,
    };
  }
}
