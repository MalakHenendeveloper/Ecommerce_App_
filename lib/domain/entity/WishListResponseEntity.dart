import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';

import 'CateegoryResonseEntity.dart';

class WishListResponseEntity {
  WishListResponseEntity({
      this.status, 
      this.count, 
      this.data,});

  String? status;
  num? count;
  List<WishListEntity>? data;


}

class WishListEntity {
  WishListEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
  });

  num? sold;
  List<String>? images;
  List<WishListSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryEntity? category;
  BrandsEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;



}


class WishListSubcategoryEntity {
  WishListSubcategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

 
  String? id;
  String? name;
  String? slug;
  String? category;

 
}