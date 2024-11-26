// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_Source/Home/HomeDataSource.dart';
import 'package:ecommerce_app/domain/Reposetory/HomeRepository.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as :HomeRepository)
class Homerepositoryimp implements HomeRepository {
  Homedatasource homedatasource;
  Homerepositoryimp({
    required this.homedatasource,
  });
  @override
  Future<Either<Fauilers, CategoreResponseEntity>> getcategory() async{
   var either=await homedatasource.getCategory();
 return  either.fold((error)=>Left(error), (success)=>Right(success));
  }

  @override
  Future<Either<Fauilers, BrandsResponseEntity>> getbrands()async {
   var either=await homedatasource.getbrands();
   return either.fold((error)=>Left(error), (success)=>Right(success));
  }

  @override
  Future<Either<Fauilers, ProductResponeEntity>> getproduct() async{
   var either= await homedatasource.getproducts();
 return  either.fold((error)=>Left(error), (success)=>Right(success));
  }

  @override
  Future<Either<Fauilers, AddToCartResponseEntity>> addtocart(String productid)async {
    var either=await homedatasource.addtocart(productid);
    return either.fold((error)=>Left(error),(success) =>Right(success));
  }
}
