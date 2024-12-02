import 'package:equatable/equatable.dart';
import 'package:bloc_tutorial_app/utils/enums.dart';
import 'package:bloc_tutorial_app/model/favourite_item_model.dart';

class FavouriteItemStates extends Equatable {
  const FavouriteItemStates({
    this.favouriteItemList = const [],
    this.tempFavouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempFavouriteItemList;
  final ListStatus listStatus;

  FavouriteItemStates copyWith({
    List<FavouriteItemModel>? favouriteItemList,
    List<FavouriteItemModel>? tempFavouriteItemList,
    ListStatus? listStatus,
  }) {
    return FavouriteItemStates(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      listStatus: listStatus ?? this.listStatus,
      tempFavouriteItemList: tempFavouriteItemList ?? this.tempFavouriteItemList,
    );
  }

  @override
  List<Object?> get props => [favouriteItemList, tempFavouriteItemList, listStatus];
}
