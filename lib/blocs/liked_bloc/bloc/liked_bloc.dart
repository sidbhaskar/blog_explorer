import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/blog_model.dart';
import '../../../repositories/liked_blog_repository.dart'; // Import the singleton

part 'liked_event.dart';
part 'liked_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitial()) {
    on<LikeInitialEvent>(likeInitialEvent);
  }

  FutureOr<void> likeInitialEvent(
      LikeInitialEvent event, Emitter<LikeState> emit) {
    final likedBlogs = LikedBlogRepository().likedBlogs;
    emit(LikeSuccessState(likedBlogs: likedBlogs));
  }
}
