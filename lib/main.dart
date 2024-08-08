import 'package:blog_explorer/blocs/home_bloc/bloc/home_bloc.dart';
import 'package:blog_explorer/repositories/blog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/liked_bloc/bloc/liked_bloc.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(BlogService()),
        ),
        BlocProvider(
          create: (context) => LikeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SubSurface Task',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
