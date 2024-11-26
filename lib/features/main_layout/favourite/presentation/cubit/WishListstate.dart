import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';

abstract class WishListState {}

class WishListInataialg extends WishListState {}

class WishListLoading extends WishListState {}

class WishListError extends WishListState {
  Fauilers fauilers;

  WishListError({required this.fauilers});
}

class WishListSuccess extends WishListState {
  WishListResponseEntity wish;

  WishListSuccess({required this.wish});
}

class deletWishListLoading extends WishListState {}

class deletWishListError extends WishListState {
  Fauilers fauilers;

  deletWishListError({required this.fauilers});
}
