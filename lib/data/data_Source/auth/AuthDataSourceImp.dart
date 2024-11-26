// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/Models/LoginResponseDto.dart';
import 'package:ecommerce_app/data/Models/RegisterResponseDto.dart';
import 'package:ecommerce_app/core/api/APiManger.dart';
import 'package:ecommerce_app/core/api/Endpoints.dart';
import 'package:ecommerce_app/data/data_Source/auth/AuthDataSource.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/RegisterResponseEntity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:Authdatasource )
class Authdatasourceimp implements Authdatasource {
  Apimanger apimanger;
  Authdatasourceimp({
    required this.apimanger,
  });
  Future<Either<Fauilers, RegisterResponseEntity>> register(String name,
      String email, String password, String repassword, String phone) async {
    try {
      var response = await apimanger.PostDate(Endpoints.Register, headers: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": repassword,
        "phone": phone
      });

      var registerRespone = RegisterResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(registerRespone);
      } else {
        return Left(ServerError(ErrorMesage: registerRespone.message!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMesage: e.toString()));
    }
  }

  @override
  Future<Either<Fauilers, LoginResponseEntity>> login(String email, String password)async {
  try {
    var response=await apimanger.PostDate(Endpoints.Login, headers: {
      "email":email, 
      "password":password
    });

    var LoginResponse=LoginResponseDto.fromJson(response.data);
    if (response.statusCode!>=200&& response.statusCode!<=299) {
      return Right(LoginResponse);
    } else {
      return Left(ServerError(ErrorMesage: response.statusMessage!));
    }
  } catch (e) {
    return Left(NetworkError(ErrorMesage: e.toString()));
  }
  }
}
