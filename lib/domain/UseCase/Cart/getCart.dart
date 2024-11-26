import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/CartRepository.dart';
import 'package:injectable/injectable.dart';

import '../../entity/GetCartResponseEntity.dart';
import '../fauiler.dart';
@injectable
class GetcartUseCase{
  cartRepository get;

  GetcartUseCase({required this.get});
  Future<Either<Fauilers, GetCartResponseEntity>> invok(){
   return get.getcart();
  }
}