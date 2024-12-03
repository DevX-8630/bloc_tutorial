import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

class PostFetched extends PostsEvent {}

class SearchItem extends PostsEvent {
  final String stSearch;

  const SearchItem({this.stSearch = ''});

  @override
  List<Object?> get props => [stSearch];
}
