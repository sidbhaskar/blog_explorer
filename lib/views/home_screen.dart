import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc/bloc/home_bloc.dart';
import '../widgets/blog_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Explorer'),
        actions: [
          const Text('Liked'),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            BlocProvider.of<HomeBloc>(context).add(HomeFetchBlogsEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedSuccessState) {
            return FadeInUp(
              child: ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) {
                  return BlogTile(blog: state.blogs[index]);
                },
              ),
            );
          } else if (state is HomeErrorState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return Container();
        },
      ),
    );
  }
}
