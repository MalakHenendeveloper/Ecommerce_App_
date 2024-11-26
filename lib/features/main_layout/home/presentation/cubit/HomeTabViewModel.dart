import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/UseCase/Home/BrandsUseCase.dart';
import 'package:ecommerce_app/domain/UseCase/Home/CategoryUsecase.dart';
import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/HomeTabState.dart';
import 'package:injectable/injectable.dart';
@injectable
class Hometabviewmodel extends Cubit<HomeTabState>{
  Hometabviewmodel({required this.categoryusecase, required this.brandsusecase}):super(HomeTabStateInatial());
  Categoryusecase categoryusecase;
  Brandsusecase brandsusecase;
  List<CategoryEntity>?categoriesList=[];
  List<BrandsEntity>?BrandsList=[];
  void getAllCategory()async{
    emit(CategoriesStateLoading());
    var either=await categoryusecase.invok();
    either.fold((error){ emit(CategoriesStateError(fauilers: error));}, 
    (success){

    if (BrandsList !=null) {
        categoriesList=success.data!;
      emit(CategoriesStateSuccess(categoreResponseEntity: success));
      
    }
      
      });
  }
  void getAllBrands ()async{
emit(BrandstateLoading());
var either=await brandsusecase.invok();
either.fold((error)=> emit(BrandstateError(fauilers: error)), 
(response){
if (categoriesList !=null) {
    BrandsList=response.data!;
  emit(BrandstateSuccess(brandsEntity: response));
}
}
);

  }
}