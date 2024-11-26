import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/CartRepository.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../fauiler.dart';

@injectable
class UpdateCountUseCase{
  cartRepository cart;

  UpdateCountUseCase({required this.cart});
  Future<Either<Fauilers, GetCartResponseEntity>> invok(String productid, int count ){
 return cart.UpdateCountcart(productid, count);
}
}