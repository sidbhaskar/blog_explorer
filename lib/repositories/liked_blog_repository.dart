import '../models/blog_model.dart';

class LikedBlogRepository {
  static final LikedBlogRepository _instance = LikedBlogRepository._internal();

  factory LikedBlogRepository() {
    return _instance;
  }

  LikedBlogRepository._internal();

  final List<Blog> _likedBlogs = [];

  List<Blog> get likedBlogs => _likedBlogs;

  void addBlog(Blog blog) {
    _likedBlogs.add(blog);
  }

  void removeBlog(Blog blog) {
    _likedBlogs.remove(blog);
  }

  bool isBlogLiked(Blog blog) {
    return _likedBlogs.contains(blog);
  }
}
