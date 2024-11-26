import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';

abstract class WishListDataSource{
  Future<Either<Fauilers, WishListResponseEntity>>addwishlist(String productid);
  Future<Either<Fauilers, WishListResponseEntity>>deletewishlist(String productid);

  Future<Either<Fauilers, WishListResponseEntity>>getwishlist();

}