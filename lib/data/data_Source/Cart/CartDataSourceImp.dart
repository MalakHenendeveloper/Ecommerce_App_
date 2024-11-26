import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/Endpoints.dart';
import 'package:ecommerce_app/core/widget/Custtom_Shered_prefrence.dart';
import 'package:ecommerce_app/data/Models/DeletecartResponsedto.dart';
import 'package:ecommerce_app/data/Models/GetCartResponseDto.dart';
import 'package:ecommerce_app/data/data_Source/Cart/cartDataSource.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/DeleteResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/APiManger.dart';
@Injectable(as: cartDataSource)
class CartDataSourceImp implements cartDataSource {
  Apimanger apimanger;
  var token=CusttomSharedPrefrence.GetData(key: "token");
  CartDataSourceImp({required this.apimanger});
  @override
  Future<Either<Fauilers, GetCartResponseEntity>> getcart()async {
  try{

    var response=await apimanger.getDate(Endpoints.cart,
        headers: {"token":token.toString()});
    var ResponseCart=GetCartResponseDto.fromJson(response.data);
    if(response .statusCode!>=200 && response.statusCode!<=299){
      return Right(ResponseCart);
    }
    else{
      return Left(ServerError(ErrorMesage: response.statusMessage!));
    }
  }
      catch(e){
    return  Left( NetworkError(ErrorMesage: e.toString()));
      }
  }

  @override
  Future<Either<Fauilers, GetCartResponseEntity>> Deletecart(String productid) async{
   try{
     var response=await apimanger.Deletedata("${Endpoints.cart}/$productid",
     headers:{"token":token.toString()});
     var deleteresponse=GetCartResponseDto.fromJson(response.data);
     if(response.statusCode!>=200&&response.statusCode!<=299){
       return Right(deleteresponse);
     }else{
       return Left(ServerError(ErrorMesage: response.statusMessage!));
     }

   }
       catch(e){
     return Left(NetworkError(ErrorMesage: e.toString()));
       }
  }


  @override
  Future<Either<Fauilers, GetCartResponseEntity>> UpdateCountcart(String productid, int count)async {
    try{
      var response=await apimanger.UpdateData(
         "${Endpoints.cart}/$productid", body: {"count":"$count"},headers: {"token":token.toString()});
      var updateresponse=GetCartResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<=299){
        return Right(updateresponse);
      }
      else{
        return Left(ServerError(ErrorMesage: response.statusMessage!));
      }
    }
        catch(e){
      return Left(NetworkError(ErrorMesage: e.toString()));
        }
  }



}