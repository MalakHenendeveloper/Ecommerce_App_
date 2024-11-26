import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/WishListRepository.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';
import 'package:injectable/injectable.dart';

@injectable
class Deletewishlistusecase {
  WishListRepository wishListRepository;
  Deletewishlistusecase({required this.wishListRepository});
  Future<Either<Fauilers, WishListResponseEntity>> invok(String productid) {
    return wishListRepository.deletwishList(productid);
  }
}
