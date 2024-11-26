// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/Reposetory/authRepository.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/RegisterResponseEntity.dart';
import 'package:injectable/injectable.dart';
@injectable
class Registerusecase {
  Authrepository authrepository;
  Registerusecase({
    required this.authrepository,
  });
  Future<Either<Fauilers, RegisterResponseEntity>> invok(String name,
      String email, String password, String repassword, String phone) {
    return authrepository.register(name, email, password, repassword, phone);
  }
}
