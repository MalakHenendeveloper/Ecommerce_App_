import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/DeleteResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';

abstract class cartScreenState{}

class cartScreenInatail extends cartScreenState{}
class cartScreenLoading extends cartScreenState{}

class getcartScreenError extends cartScreenState{
  Fauilers fauilers;

  getcartScreenError({required this.fauilers});
}
class getcartScreenSuccess extends cartScreenState{
  GetCartResponseEntity getCartResponseEntity;

  getcartScreenSuccess(this.getCartResponseEntity);
}
class deletecartScreenLoading extends cartScreenState{}
class deletcartScreenError extends cartScreenState{
  Fauilers fauilers;

  deletcartScreenError({required this.fauilers});
}
class deletecartScreenSuccess extends cartScreenState{
  GetCartResponseEntity getCartResponseEntity;

  deletecartScreenSuccess(this.getCartResponseEntity);
}

class UpdatecartScreenLoading extends cartScreenState{}
class UpdatecartScreenError extends cartScreenState{
  Fauilers fauilers;

  UpdatecartScreenError({required this.fauilers});
}
class UpdatecartScreenSuccess extends cartScreenState{
  DeleteResponseEntity deleteResponseEntity;

  UpdatecartScreenSuccess(this.deleteResponseEntity);
}
