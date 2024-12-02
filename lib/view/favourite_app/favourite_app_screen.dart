import 'package:bloc_tutorial_app/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tutorial_app/bloc/favourite/favourite_app_bloc.dart';
import 'package:bloc_tutorial_app/bloc/favourite/favourite_app_events.dart';
import 'package:bloc_tutorial_app/bloc/favourite/favourite_app_states.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        centerTitle: true,
        actions: [
          const SizedBox(width: 16),
          BlocBuilder<FavouriteBloc, FavouriteItemStates>(
            builder: (context, state) {
              return Visibility(
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteItem());
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteItemStates>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.failure:
              return const Center(
                child: Text('Something Went Wrong!'),
              );
            case ListStatus.success:
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        item.value,
                      ),
                      leading: Checkbox(
                        value: state.tempFavouriteItemList.contains(item) ? true : false,
                        onChanged: (value) {
                          value!
                              ? context.read<FavouriteBloc>().add(SelectItem(item: item))
                              : context.read<FavouriteBloc>().add(UnSelectItem(item: item));
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          FavouriteItemModel itemModel = FavouriteItemModel(
                            id: item.id,
                            value: item.value,
                            isFavourite: item.isFavourite ? false : true,
                          );
                          context.read<FavouriteBloc>().add(FavouriteItem(item: itemModel));
                        },
                        icon: Icon(
                          item.isFavourite ? Icons.favorite : Icons.favorite_outline,
                          color: item.isFavourite ? Colors.red : null,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: state.favouriteItemList.length,
              );
          }
        },
      ),
    );
  }
}
