part of 'liked_bloc.dart';

@immutable
abstract class LikeState {}

abstract class LikeActionState extends LikeState {}

class LikeInitial extends LikeState {}

class LikeSuccessState extends LikeState {
  final List<Blog> likedBlogs;

  LikeSuccessState({required this.likedBlogs});
}
