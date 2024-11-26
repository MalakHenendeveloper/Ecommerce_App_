class BrandsResponseEntity {
  int? results;
  MetadataEntity? metadata;
  List<BrandsEntity>? data;

  BrandsResponseEntity({this.results, this.metadata, this.data});

}

class MetadataEntity{
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  MetadataEntity({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

}

class BrandsEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  BrandsEntity(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  
}
