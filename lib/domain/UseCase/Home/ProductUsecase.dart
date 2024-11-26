import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/HomeRepository.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';
import 'package:injectable/injectable.dart';

import '../fauiler.dart';

@injectable
class ProductUseCase{
  HomeRepository homeRepository;

  ProductUseCase({  required this.homeRepository});
  Future<Either<Fauilers, ProductResponeEntity>>  invok(){
 return   homeRepository.getproduct();
  }
}