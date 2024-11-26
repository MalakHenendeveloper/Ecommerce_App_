import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';

class DeleteResponseEntity {
  DeleteResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

 
  String? status;
  num? numOfCartItems;
  String? cartId;
  DeleteDataEntity? data;


}

class DeleteDataEntity {
  DeleteDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<DeleteProductsCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

}

class DeleteProductsCartEntity {
  DeleteProductsCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  DeleteProductsEntity? product;
  num? price;

}

class DeleteProductsEntity {
  DeleteProductsEntity({
      this.subcategory, 
     
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.id,});

 
  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryEntity? category;
  BrandsEntity? brand;
  num? ratingsAverage;
 

}

class SubcategoryEntity {
  SubcategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;


}