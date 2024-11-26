import 'package:ecommerce_app/domain/UseCase/Cart/AddTocartUsecase.dart';
import 'package:ecommerce_app/domain/UseCase/Home/ProductUsecase.dart';
import 'package:ecommerce_app/domain/UseCase/wishlist/AddWishListUsecase.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/cubit/ProductScreenState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class productScreenViewModel extends Cubit<ProductScreenState>{
  productScreenViewModel({required this.useCase,
    required this.Addtocart,
    required this.addWishList


  }):super(ProductScreenStateInatail());
  ProductUseCase useCase;
  AddToCartUseCase Addtocart;
  AddWishListUsecase addWishList;
  List<ProductEntity>ProductList=[];
  static productScreenViewModel get(context)=>BlocProvider.of(context);
  int numOfCartItems=0;
  void getproduct()async{
    emit(ProductScreenStateLoading());
    var either= await useCase.invok();
    either.fold((error)=>emit(ProductScreenStateError(fauilers: error)),

        (response){
      ProductList=response.data!;

      emit(ProductScreenStateSuccess(productResponeEntity: response));}
    );
  }
void AddtoCart(String productid)async{
    emit(AddToCartLoading());
    var either=await Addtocart.invok(productid);
    either.fold((error){
      emit(AddToCartLoadingError(fauilers: error));

    }, (success){
      numOfCartItems=success.numOfCartItems!.toInt();

      emit(AddToCartSuccess(addToCart: success));
    });

}
void AddWishList(String productid)async{
  emit(AddWishListLoading());
  var either=await addWishList.invok(productid);
  either.fold((error) {
    print(error);
        emit(AddWishListError(fauilers: error));
  },
      (response){
    print(response);
    emit(AddWishListSuccess(addWishList: response));
      });

}
}