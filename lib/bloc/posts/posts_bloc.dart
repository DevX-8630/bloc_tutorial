import 'package:bloc_tutorial_app/model/posts_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tutorial_app/utils/enums.dart';
import 'package:bloc_tutorial_app/bloc/posts/post_states.dart';
import 'package:bloc_tutorial_app/bloc/posts/posts_events.dart';
import 'package:bloc_tutorial_app/repository/post_repository.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {
  PostRepository postRepository = PostRepository();

  List<PostModel> temPostList = [];

  PostBloc() : super(const PostStates()) {
    on<PostFetched>(_fetchPost);
    on<SearchItem>(_filterList);
  }

  void _fetchPost(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(postStatus: PostStatus.success, message: 'Success', postList: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(postStatus: PostStatus.failure, message: error.toString()));
    });
  }

  void _filterList(SearchItem event, Emitter<PostStates> emit) {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(temPostList: [], searchMessage: ''));
    } else {
      temPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toLowerCase())).toList();
      // temPostList = state.postList.where((element) => element.email.toString() == event.stSearch.toString()).toList();
      if (temPostList.isEmpty) {
        emit(state.copyWith(temPostList: List.from(temPostList), searchMessage: 'No Data Found'));
      } else {
        emit(state.copyWith(temPostList: List.from(temPostList), searchMessage: ''));
      }
    }
  }
}
