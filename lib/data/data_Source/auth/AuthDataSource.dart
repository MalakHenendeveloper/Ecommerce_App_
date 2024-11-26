import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/RegisterResponseEntity.dart';

abstract class Authdatasource {
  Future<Either<Fauilers, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String repassword,
    String phone,
  );
  Future<Either<Fauilers,LoginResponseEntity>>login(String email, String password,);
}
