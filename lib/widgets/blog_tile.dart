import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc/bloc/home_bloc.dart';
import '../blocs/liked_bloc/bloc/liked_bloc.dart';
import '../models/blog_model.dart';

class BlogTile extends StatelessWidget {
  final Blog blog;
  final HomeBloc homeBloc;

  BlogTile({required this.homeBloc, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.network(
              blog.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final updatedBlog = Blog(
                      id: blog.id,
                      imageUrl: blog.imageUrl,
                      title: blog.title,
                      liked: !blog.liked, // Toggle liked state
                    );
                    homeBloc.add(HomeBlogLikedButtonClickedEvent(
                        likedBlog: updatedBlog));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: blog.liked ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
