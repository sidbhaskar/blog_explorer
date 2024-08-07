part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeFetchBlogsEvent extends HomeEvent {}

class HomeBlogLikedButtonClickedEvent extends HomeEvent {}

class HomeLikedButtonNavigatorEvent extends HomeEvent {}
