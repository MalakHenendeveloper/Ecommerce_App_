import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/DeleteResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';

abstract class cartRepository{
  Future<Either<Fauilers, GetCartResponseEntity>>getcart();
  Future<Either<Fauilers, GetCartResponseEntity>>deletecart(String productid);
  Future<Either<Fauilers, GetCartResponseEntity>>UpdateCountcart(String productid, int count);
}