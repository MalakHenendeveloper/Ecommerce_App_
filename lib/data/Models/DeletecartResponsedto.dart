import 'package:ecommerce_app/domain/entity/DeleteResponseEntity.dart';

import 'BrandsResponseDto.dart';
import 'CategoryResponseDto.dart';

class DeletecartResponsedto extends DeleteResponseEntity {
  DeletecartResponsedto({
      super.status, 
      super.numOfCartItems, 
      super.cartId, 
      super.data,});

  DeletecartResponsedto.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? deletedatadto.fromJson(json['data']) : null;
  }

}

class deletedatadto extends DeleteDataEntity{
  deletedatadto({
      super.id, 
      super.cartOwner, 
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  deletedatadto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(DeleteProductsCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

}

class DeleteProductsCartDto extends DeleteProductsCartEntity {
  DeleteProductsCartDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  DeleteProductsCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? DeleteProductdto.fromJson(json['product']) : null;
    price = json['price'];
  }


}

class DeleteProductdto extends DeleteProductsEntity {
  DeleteProductdto({
      super.subcategory,

      super.title,
      super.quantity,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      super.id,});

  DeleteProductdto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
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


class Subcategory extends SubcategoryEntity{
  Subcategory({
      super.id, 
      super.name, 
      super.slug, 
      super.category,});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

}