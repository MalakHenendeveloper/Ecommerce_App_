import 'package:ecommerce_app/data/Models/ProductsResponseDto.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';

import 'BrandsResponseDto.dart';
import 'CategoryResponseDto.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  GetCartResponseDto({
      super.status, 
      super.numOfCartItems, 
      super.cartId, 
      super.data,});

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataDto.fromJson(json['data']) : null;
  }
}

class GetDataDto  extends GetDataEntity{
  GetDataDto({
      super.id, 
      super.cartOwner, 
      super.products, 
      super.createdAt, 
      super.updatedAt, 
      super.v, 
      super.totalCartPrice,});

  GetDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductsCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

}

class GetProductsCartDto extends GetProductCartEntity {
  GetProductsCartDto({
      super.count, 
      super.id, 
      super.product, 
      super.price,});

  GetProductsCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? GetProductsDto.fromJson(json['product']) : null;
    price = json['price'];
  }

}

class GetProductsDto extends GetProductEntity{
  GetProductsDto({
      super.subcategory, 
      super.id, 
      super.title, 
      super.quantity, 
      super.imageCover, 
      super.category, 
      super.brand, 
      super.ratingsAverage, 
      });

  GetProductsDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? DataDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Data.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}
