// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/LoginResponseEntity.dart';
import 'package:injectable/injectable.dart';

import 'package:ecommerce_app/domain/Reposetory/authRepository.dart';

@injectable
class Loginusecase {
  Authrepository authrepository;
  Loginusecase({
    required this.authrepository,
  });
Future<Either<Fauilers, LoginResponseEntity>>  invok(String email, String password){
 return    authrepository.login( email, password);
  }
}
