import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tutorial_app/utils/enums.dart';
import 'package:bloc_tutorial_app/bloc/posts/post_states.dart';
import 'package:bloc_tutorial_app/bloc/posts/posts_events.dart';
import 'package:bloc_tutorial_app/repository/post_repository.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostStates()) {
    on<PostFetched>(_fetchPost);
  }

  void _fetchPost(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(postStatus: PostStatus.success, message: 'Success', postList: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
