class CategoreResponseEntity {
  int? results;
  MetadataEntity? metadata;
  List<CategoryEntity>? data;

  CategoreResponseEntity({this.results, this.metadata, this.data});


}

class MetadataEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataEntity({this.currentPage, this.numberOfPages, this.limit});

}

class CategoryEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryEntity(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

 
}
