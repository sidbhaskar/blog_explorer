import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/blog_model.dart';
import '../../../repositories/liked_blog_repository.dart';

part 'liked_event.dart';
part 'liked_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitial()) {
    on<LikeInitialEvent>(likeInitialEvent);
    on<LikeBlogRemovedEvent>(likeBlogRemovedEvent);
  }

  FutureOr<void> likeInitialEvent(
      LikeInitialEvent event, Emitter<LikeState> emit) {
    final likedBlogs = LikedBlogRepository().likedBlogs;
    emit(LikeSuccessState(likedBlogs: likedBlogs));
  }

  FutureOr<void> likeBlogRemovedEvent(
      LikeBlogRemovedEvent event, Emitter<LikeState> emit) {
    LikedBlogRepository().removeBlog(event.blog);
    final updatedLikedBlogs = LikedBlogRepository().likedBlogs;
    emit(LikeSuccessState(likedBlogs: updatedLikedBlogs));
  }
}
