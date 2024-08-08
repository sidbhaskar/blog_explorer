import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/blog_model.dart';
import '../../../repositories/blog_service.dart';
import '../../../repositories/liked_blog_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BlogService _blogService;

  HomeBloc(this._blogService) : super(HomeInitial()) {
    on<HomeFetchBlogsEvent>(homeFetchBlogsEvent);
    on<HomeBlogLikedButtonClickedEvent>(homeBlogLikedButtonClickedEvent);
    on<HomeLikedButtonNavigatorEvent>(homeLikedButtonNavigatorEvent);
  }

  FutureOr<void> homeFetchBlogsEvent(
      HomeFetchBlogsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final blogs = await _blogService.fetchBlogs();
      emit(HomeLoadedSuccessState(blogs: blogs));
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> homeBlogLikedButtonClickedEvent(
      HomeBlogLikedButtonClickedEvent event, Emitter<HomeState> emit) {
    LikedBlogRepository().addBlog(event.likedBlog);
    emit(HomeProductItemLikedActionState());
  }

  FutureOr<void> homeLikedButtonNavigatorEvent(
      HomeLikedButtonNavigatorEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToLikedPageActionState());
  }
}
