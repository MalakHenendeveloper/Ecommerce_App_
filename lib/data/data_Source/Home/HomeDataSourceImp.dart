// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/core/api/APiManger.dart';
import 'package:ecommerce_app/core/api/Endpoints.dart';
import 'package:ecommerce_app/core/widget/Custtom_Shered_prefrence.dart';
import 'package:ecommerce_app/data/Models/AddToCartDto.dart';
import 'package:ecommerce_app/data/Models/BrandsResponseDto.dart';
import 'package:ecommerce_app/data/Models/CategoryResponseDto.dart';
import 'package:ecommerce_app/data/Models/ProductsResponseDto.dart';
import 'package:ecommerce_app/data/data_Source/Home/HomeDataSource.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:Homedatasource )
class Homedatasourceimp implements Homedatasource {
  Apimanger apimanger;
  Homedatasourceimp({
    required this.apimanger,
  });
  @override
  Future<Either<Fauilers, CategoreResponseEntity>> getCategory()async {
  try {
    var response=await apimanger.getDate(Endpoints.categories);
    var Categoriesresponse=CategoreResponseDto.fromJson(response.data);
    if (response.statusCode!>=200&& response.statusCode!<=299) {
      return Right(Categoriesresponse);
    } else {
      return Left(ServerError(ErrorMesage: Categoriesresponse.message!));
    }
  } catch (e) {
    return Left(NetworkError(ErrorMesage: e.toString()));
  }
  }

  @override
  Future<Either<Fauilers, BrandsResponseEntity>> getbrands() async{
 try {
    var response=await apimanger.getDate(Endpoints.Brands);
  var Brandsresponse=BrandsResponseDto.fromJson(response.data);
   if (response.statusCode!>=200&& response.statusCode!<=299) {
      return Right(Brandsresponse);
    } else {
      return Left(ServerError(ErrorMesage: Brandsresponse.message!));
    }
 } catch (e) {
   return Left(NetworkError(ErrorMesage: e.toString()));
 }
  }

  @override
  Future<Either<Fauilers, ProductResponeEntity>> getproducts()async {
 try{

   var response=await apimanger.getDate(Endpoints.products);
   var ProductResponse=ProductsResponseDto.fromJson(response.data);
   if(response.statusCode!>=200&& response.statusCode!<=299){
     return Right(ProductResponse);
   }
   else{
     return Left(ServerError(ErrorMesage: response.statusMessage!));
   }
 }catch(e){ return Left(NetworkError(ErrorMesage:e.toString()));}


  }

  @override
  Future<Either<Fauilers, AddToCartResponseEntity>> addtocart(String productid) async{
   try{
     var token= CusttomSharedPrefrence.GetData(key: 'token');
     var response= await apimanger.PostDate(Endpoints.cart,
         body: {
       "productId":productid
     } ,
     headers: {
       "token":token.toString()
         }
     );
     var AddcartResponse=AddToCartResponseDto.fromJson(response.data);
     if(response.statusCode!>=200&& response.statusCode!<=299) {
      return Right(AddcartResponse);
     }
     else{
       return Left(ServerError(ErrorMesage: response.statusMessage!));
     }
   }
       catch(e){
         return Left(NetworkError(ErrorMesage:e.toString()));

       }
  }


}
