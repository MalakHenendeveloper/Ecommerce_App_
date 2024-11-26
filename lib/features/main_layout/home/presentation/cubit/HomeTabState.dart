// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';

abstract class HomeTabState{

}
class HomeTabStateInatial extends HomeTabState{}
class CategoriesStateLoading extends HomeTabState{}
class CategoriesStateError extends HomeTabState {
  Fauilers fauilers;
  CategoriesStateError({
    required this.fauilers,
  });
}
class CategoriesStateSuccess extends HomeTabState {
  CategoreResponseEntity categoreResponseEntity;
  //or List<categoryentity>category;
  CategoriesStateSuccess({
    required this.categoreResponseEntity,
  });
}
class BrandstateLoading extends HomeTabState{}
class BrandstateError extends HomeTabState {
  Fauilers fauilers;
  BrandstateError({
    required this.fauilers,
  });
}
class BrandstateSuccess extends HomeTabState {
BrandsResponseEntity brandsEntity;
  //or List<Brandsentity>category;
  BrandstateSuccess({
    required this.brandsEntity,
  });
}
