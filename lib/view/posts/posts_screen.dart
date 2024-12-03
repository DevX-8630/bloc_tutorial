import 'package:bloc_tutorial_app/bloc/posts/post_states.dart';
import 'package:bloc_tutorial_app/bloc/posts/posts_bloc.dart';
import 'package:bloc_tutorial_app/bloc/posts/posts_events.dart';
import 'package:bloc_tutorial_app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen Get API Use'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.failure:
              return Center(
                child: Text(state.message),
              );
            case PostStatus.success:
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search with Email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (filterKey) {
                        context.read<PostBloc>().add(SearchItem(stSearch: filterKey.toString()));
                      },
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: state.searchMessage.isNotEmpty
                          ? const Center(
                              child: Text('No Data Found'),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                final item = state.temPostList.isEmpty ? state.postList[index] : state.temPostList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                      item.email.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      item.body.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              itemCount: state.temPostList.isEmpty ? state.postList.length : state.temPostList.length),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
