import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

 
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataEntity? data;

}

class GetDataEntity {
  GetDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<GetProductCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  

}

class GetProductCartEntity {
  GetProductCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  GetProductEntity? product;
  num? price;


}

class GetProductEntity {
  GetProductEntity({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
     });

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryEntity? category;
  BrandsEntity? brand;
  num? ratingsAverage;
  

}
