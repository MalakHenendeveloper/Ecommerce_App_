// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/RegisterResponseEntity.dart';

abstract class Registerstate {

}
class RegisterInaital extends Registerstate{}
class RegisterLoading extends Registerstate{}
class RegisterError extends Registerstate {
  Fauilers fauilers;
  RegisterError({
    required this.fauilers,
  });

}

class RegisterSuccess extends Registerstate {
  RegisterResponseEntity register;
  RegisterSuccess({
    required this.register,
  });

}
