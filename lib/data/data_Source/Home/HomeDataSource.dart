import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';

abstract class Homedatasource {
  Future<Either<Fauilers, CategoreResponseEntity>>getCategory();
  Future<Either<Fauilers, BrandsResponseEntity>>getbrands();
  Future<Either<Fauilers, ProductResponeEntity>>getproducts();
  Future<Either<Fauilers, AddToCartResponseEntity>>addtocart(String productid);

}