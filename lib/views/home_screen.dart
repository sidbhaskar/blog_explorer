import 'package:blog_explorer/repositories/blog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc/bloc/home_bloc.dart';
import '../widgets/blog_tile.dart';
import 'liked_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeFetchBlogsEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc(BlogService());
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToLikedPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LikedScreen(),
            ),
          );
        } else if (state is HomeProductItemLikedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Blog Liked')),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Blog Explorer'),
                actions: [
                  GestureDetector(
                      onTap: () {
                        homeBloc.add(
                          HomeLikedButtonNavigatorEvent(),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text('View Liked'),
                      )),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.blogs.length,
                itemBuilder: (context, index) {
                  return BlogTile(
                    blog: successState.blogs[index],
                    homeBloc: homeBloc,
                  );
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return Text('problem');
        }
      },
    );
  }
}
