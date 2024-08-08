class Blog {
  final String id;
  final String imageUrl;
  final String title;
  bool liked; // New property

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.liked = false, // Default to false
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      imageUrl: json['image_url'],
      title: json['title'],
      liked: json['liked'] ?? false, // Handle if `liked` key is missing
    );
  }
}
