// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/LoginResponseEntity.dart';

abstract class Loginstate {}
class LoginInatial extends Loginstate{}
class LoginLoading extends Loginstate{}
class LoginError extends Loginstate {
  Fauilers fauilers;
  LoginError({
    required this.fauilers,
  });

}


class LoginSuccess extends Loginstate {
  LoginResponseEntity loginResponseEntity;
  LoginSuccess({
    required this.loginResponseEntity,
  });
  }
