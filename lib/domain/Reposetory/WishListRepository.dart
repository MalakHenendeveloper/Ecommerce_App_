
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';

abstract class WishListRepository{
  Future<Either<Fauilers, WishListResponseEntity>>getwishList();
  Future<Either<Fauilers, WishListResponseEntity>>deletwishList(String productid);
  Future<Either<Fauilers, WishListResponseEntity>>addwishList(String productid);
}