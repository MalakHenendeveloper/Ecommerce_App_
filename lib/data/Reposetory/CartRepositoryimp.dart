import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_Source/Cart/cartDataSource.dart';
import 'package:ecommerce_app/domain/Reposetory/CartRepository.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/DeleteResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:cartRepository)
class CartRepositoryImp implements cartRepository {
  cartDataSource cart;
  CartRepositoryImp({required this.cart});
  @override
  Future<Either<Fauilers, GetCartResponseEntity>> getcart() async{
  var either= await cart.getcart();
   return either.fold((error)=>Left(error), (success)=>Right(success));
  }

  @override
  Future<Either<Fauilers, GetCartResponseEntity>> deletecart(String productid) async{
   var either= await cart.Deletecart(productid);
   return either.fold((error)=>Left(error), (success)=>Right(success));
  }

  @override
  Future<Either<Fauilers, GetCartResponseEntity>> UpdateCountcart(String productid, int count) async{
  var either=await cart.UpdateCountcart(productid, count);
  return either.fold((error)=>Left(error), (success)=>Right(success));
  }
}