
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/HomeRepository.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:injectable/injectable.dart';

import '../fauiler.dart';

@injectable
class AddToCartUseCase{
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});
  Future<Either<Fauilers, AddToCartResponseEntity>> invok(String productid){
return  homeRepository.addtocart(productid);
}

}