 import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/WishListRepository.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../fauiler.dart';
@injectable
class getWishListUsecase{
   WishListRepository  get ;

   getWishListUsecase({required this.get});
   Future<Either<Fauilers, WishListResponseEntity>>   invok (){
     return get.getwishList();
   }
}