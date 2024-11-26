import 'package:ecommerce_app/data/Models/BrandsResponseDto.dart';
import 'package:ecommerce_app/data/Models/CategoryResponseDto.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';

class WishListResponseDto extends WishListResponseEntity{
  WishListResponseDto({
      super.status, 
      super.count, 
      super.data,});

  WishListResponseDto.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WishListDto.fromJson(v));
      });
    }
  }

}

class WishListDto extends WishListEntity{
  WishListDto({
      super.sold, 
      super.images, 
      super.subcategory, 
      super.ratingsQuantity, 
      super.id, 
      super.title, 
      super.slug, 
      super.description, 
      super.quantity, 
      super.price, 
      super.imageCover, 
      super.category, 
      super.brand, 
      super.ratingsAverage, 
      super.createdAt, 
      super.updatedAt, 
      super.v, 
     });



  WishListDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(whshlistSubcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? DataDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Data.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}


class whshlistSubcategory extends WishListSubcategoryEntity{
  whshlistSubcategory({
      super.id, 
      super.name, 
      super.slug, 
      super.category,});

  whshlistSubcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}