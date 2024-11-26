// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/domain/Reposetory/HomeRepository.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:injectable/injectable.dart';
@injectable
class Brandsusecase {
  HomeRepository homeRepository;
  Brandsusecase({
    required this.homeRepository,
  });
  Future<Either<Fauilers, BrandsResponseEntity>>invok(){
    return homeRepository.getbrands();
  }
}
