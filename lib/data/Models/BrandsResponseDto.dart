import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';

class BrandsResponseDto extends BrandsResponseEntity{
String ?message;
  BrandsResponseDto({super.results, super.metadata, super.data, this.message});

  BrandsResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results'];message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Metadata extends MetadataEntity{
 

  Metadata({super.currentPage, super.numberOfPages, super.limit, super.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

}

class Data extends BrandsEntity {


  Data(
      {super.sId,
      super.name,
      super.slug,
      super.image,
      super.createdAt,
      super.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
