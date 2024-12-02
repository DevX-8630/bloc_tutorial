import 'package:bloc_tutorial_app/model/posts_model.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_tutorial_app/utils/enums.dart';

class PostStates extends Equatable {
  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
  });

  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  PostStates copyWith({PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList, message];
}
