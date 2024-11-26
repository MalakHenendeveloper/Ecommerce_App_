import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';

class     CategoreResponseDto   extends  CategoreResponseEntity {
 String ?message;

  CategoreResponseDto({super.results, super.metadata, super.data, this.message});

  CategoreResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results']; message = json['message'];
    metadata = json['metadata'] != null
        ? new MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <DataDto>[];
      json['data'].forEach((v) {
        data!.add(new DataDto.fromJson(v));
      });
    }
  }

 
}

class MetadataDto extends MetadataEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataDto({this.currentPage, this.numberOfPages, this.limit});

  MetadataDto.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['numberOfPages'] = this.numberOfPages;
    data['limit'] = this.limit;
    return data;
  }
}

class DataDto extends CategoryEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  DataDto(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  DataDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
