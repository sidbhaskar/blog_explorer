part of 'liked_bloc.dart';

@immutable
abstract class LikeEvent {}

class LikeInitialEvent extends LikeEvent {}

class LikeBlogRemovedEvent extends LikeEvent {
  final Blog blog;

  LikeBlogRemovedEvent({required this.blog});
}
