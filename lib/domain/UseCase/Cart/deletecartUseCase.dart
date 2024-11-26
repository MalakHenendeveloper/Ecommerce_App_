import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/CartRepository.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/DeleteResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/features/cart/screens/Cubit/CartScreenState.dart';
import 'package:injectable/injectable.dart';


@injectable
class DeleteCartUseCase{
  cartRepository delet;
  DeleteCartUseCase({required this.delet});
  Future<Either<Fauilers, GetCartResponseEntity>> invok(String productid){
    return delet.deletecart(productid);
  }


}