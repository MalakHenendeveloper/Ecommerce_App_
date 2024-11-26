import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';

abstract class ProductScreenState{}
class ProductScreenStateInatail extends ProductScreenState{}
class ProductScreenStateLoading extends ProductScreenState{}
class ProductScreenStateError extends ProductScreenState{
  Fauilers fauilers;

  ProductScreenStateError({required this.fauilers});
}
class ProductScreenStateSuccess extends ProductScreenState{
  ProductResponeEntity productResponeEntity;

  ProductScreenStateSuccess({required this.productResponeEntity});
}
class AddToCartLoading extends ProductScreenState{}

class AddToCartLoadingError extends ProductScreenState{
  Fauilers fauilers;

  AddToCartLoadingError({required this.fauilers});
}
class AddToCartSuccess extends ProductScreenState{

AddToCartResponseEntity addToCart;
AddToCartSuccess({required this.addToCart});
}
class AddWishListLoading extends ProductScreenState{}
class AddWishListError extends ProductScreenState{
  Fauilers fauilers;

  AddWishListError({required this.fauilers});
}
class AddWishListSuccess extends ProductScreenState{

  WishListResponseEntity addWishList;
  AddWishListSuccess({required this.addWishList});
}
