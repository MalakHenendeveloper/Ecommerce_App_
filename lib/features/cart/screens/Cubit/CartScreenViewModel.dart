import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/UseCase/Cart/deletecartUseCase.dart';
import 'package:ecommerce_app/domain/UseCase/Cart/getCart.dart';
import 'package:ecommerce_app/domain/UseCase/Cart/updatecartUsecase.dart';
import 'package:ecommerce_app/features/cart/screens/Cubit/CartScreenState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entity/GetCartResponseEntity.dart';
@injectable
class CartScreenViewModel extends Cubit<cartScreenState>{
  CartScreenViewModel({required this.usecase, required this.deleteUseCase, required this.update}):super(cartScreenInatail());

  GetcartUseCase usecase;
  DeleteCartUseCase deleteUseCase;
  UpdateCountUseCase update;
  List<GetProductCartEntity>Data=[];
  static CartScreenViewModel get(context)=>BlocProvider.of(context);
 void getCart()async{
    emit(cartScreenLoading());
    var either=await usecase.invok();
    either.fold((error)=>emit(getcartScreenError(fauilers: error)), (response){
      //Data=response.data!.products??[];
      emit(getcartScreenSuccess(response));
    });
  }
  void Deletecart(String productid)async{
    emit(deletecartScreenLoading());
    var ethier= await deleteUseCase.invok(productid);
    ethier.fold((error)=>emit(deletcartScreenError(fauilers: error)),
            (success) {
              emit(getcartScreenSuccess(success));

            }
    );

}


void Updatecount(String productid,int count)async{
   emit(UpdatecartScreenLoading());
   var either=await update.invok(productid, count);
   either.fold((error){
     print(error.ErrorMesage);
     emit  (UpdatecartScreenError(fauilers: error));},
           (response)=> emit(getcartScreenSuccess(response)));
}
}