import 'package:ecommerce_app/data/Models/BrandsResponseDto.dart';
import 'package:ecommerce_app/data/Models/CategoryResponseDto.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';

class ProductsResponseDto  extends ProductResponeEntity{
  ProductsResponseDto({
      super.results,
    super.metadata,
    super.data,});

  ProductsResponseDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? MetadataDto.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProdectDto.fromJson(v));
      });
    }
  }

}

class ProdectDto extends ProductEntity {
  ProdectDto({
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
     });

  ProdectDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
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
    id = json['id'];
  }



}

class SubcategoryDto extends SubcategoryEntity {
  SubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,});

  SubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }


}

class MetadataDto extends MetadataEntity{
  MetadataDto({
      super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,});

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }



}