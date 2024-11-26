import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_Source/wishlist/WishlistDataSource.dart';
import 'package:ecommerce_app/domain/Reposetory/WishListRepository.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishListRepository)
class WishListRepositoryImpl implements WishListRepository {
  WishListDataSource data;

  WishListRepositoryImpl({required this.data});

  @override
  Future<Either<Fauilers, WishListResponseEntity>> addwishList(
      String productid) async {
    var either = await data.addwishlist(productid);
    return either.fold((error) => Left(error), (success) => Right(success));
  }

  @override
  Future<Either<Fauilers, WishListResponseEntity>> deletwishList(
      String productid) async {
    var either = await data.deletewishlist(productid);
    return either.fold((error) => Left(error), (success) => Right(success));
  }

  @override
  Future<Either<Fauilers, WishListResponseEntity>> getwishList() async {
    var either = await data.getwishlist();
    return either.fold((error) => Left(error), (success) => Right(success));
  }
}
