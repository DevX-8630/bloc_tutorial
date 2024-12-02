import 'package:equatable/equatable.dart';
import 'package:bloc_tutorial_app/model/favourite_item_model.dart';

abstract class FavouriteEvents extends Equatable {
  const FavouriteEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvents {}

class FavouriteItem extends FavouriteEvents {
  final FavouriteItemModel item;

  const FavouriteItem({
    required this.item,
  });

  @override
  List<Object?> get props => [item];
}

class SelectItem extends FavouriteEvents {
  final FavouriteItemModel item;

  const SelectItem({
    required this.item,
  });
  @override
  List<Object?> get props => [item];
}

class UnSelectItem extends FavouriteEvents {
  final FavouriteItemModel item;

  const UnSelectItem({
    required this.item,
  });
  @override
  List<Object?> get props => [item];
}

class DeleteItem extends FavouriteEvents {}
