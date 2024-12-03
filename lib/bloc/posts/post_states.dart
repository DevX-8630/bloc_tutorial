import 'package:equatable/equatable.dart';
import 'package:bloc_tutorial_app/utils/enums.dart';
import 'package:bloc_tutorial_app/model/posts_model.dart';

class PostStates extends Equatable {
  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
    this.temPostList = const <PostModel>[],
    this.searchMessage = '',
  });

  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;
  final List<PostModel> temPostList;
  final String searchMessage;

  PostStates copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
    List<PostModel>? temPostList,
    String? searchMessage,
  }) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
      temPostList: temPostList ?? this.temPostList,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList, message, temPostList, searchMessage];
}
