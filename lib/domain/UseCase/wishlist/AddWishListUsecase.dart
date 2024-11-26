import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/WishListRepository.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../fauiler.dart';

@injectable
class AddWishListUsecase{
  WishListRepository add;

  AddWishListUsecase({required this.add});
  Future<Either<Fauilers, WishListResponseEntity>>  invok(String productid){
    return add.addwishList(productid);
  }
}