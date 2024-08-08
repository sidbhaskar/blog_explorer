part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<Blog> blogs;

  HomeLoadedSuccessState({required this.blogs});
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}

class HomeNavigateToLikedPageActionState extends HomeActionState {}

class HomeProductItemLikedActionState extends HomeActionState {}
