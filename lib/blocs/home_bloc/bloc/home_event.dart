part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeFetchBlogsEvent extends HomeEvent {}

class HomeBlogLikedButtonClickedEvent extends HomeEvent {
  final Blog likedBlog;

  HomeBlogLikedButtonClickedEvent({required this.likedBlog});
}

class HomeLikedButtonNavigatorEvent extends HomeEvent {}
