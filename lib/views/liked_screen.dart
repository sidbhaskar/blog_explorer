import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/liked_bloc/bloc/liked_bloc.dart';
import '../widgets/liked_blog_tile.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LikeBloc>().add(LikeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Blogs'),
      ),
      body: BlocConsumer<LikeBloc, LikeState>(
        listener: (context, state) {},
        listenWhen: (previous, current) => current is LikeActionState,
        buildWhen: (previous, current) => current is! LikeActionState,
        builder: (context, state) {
          if (state is LikeSuccessState) {
            return ListView.builder(
              itemCount: state.likedBlogs.length,
              itemBuilder: (context, index) {
                return LikedBlogTile(
                  blog: state.likedBlogs[index],
                  likeBloc: context.read<LikeBloc>(),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
