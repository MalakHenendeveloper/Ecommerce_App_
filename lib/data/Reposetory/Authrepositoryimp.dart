// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_Source/auth/AuthDataSource.dart';
import 'package:ecommerce_app/domain/Reposetory/authRepository.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/RegisterResponseEntity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: Authrepository)
class AuthrepositoryImp implements Authrepository {
  Authdatasource authdatasource;
  AuthrepositoryImp({
    required this.authdatasource,
  });
  @override
  Future<Either<Fauilers, RegisterResponseEntity>> register(String name,
      String email, String password, String repassword, String phone) async {
    var either =
        await authdatasource.register(name, email, password, repassword, phone);
    return either.fold((error) => Left(error), (success) => Right(success));
  }
  
  @override
  Future<Either<Fauilers, LoginResponseEntity>> login( String email, String password) async{
     var either= await authdatasource.login(email, password);
return either.fold((error)=>Left(error), (success)=>Right(success));
  }

}
