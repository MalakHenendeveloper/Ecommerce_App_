import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/UseCase/wishlist/DeleteWishListUsecase.dart';
import 'package:ecommerce_app/domain/UseCase/wishlist/getWishListUseCase.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/WishListstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishListViewmodel extends Cubit<WishListState> {
  WishListViewmodel({required this.get, required this.delet})
      : super(WishListInataialg());
  getWishListUsecase get;
  Deletewishlistusecase delet;
  List<WishListEntity> datawih = [];
  static WishListViewmodel Get(context) => BlocProvider.of(context);
  void getWishList() async {
    emit(WishListLoading());
    var either = await get.invok();
    either.fold((error) => emit(WishListError(fauilers: error)), (success) {
      emit(WishListSuccess(wish: success));
    });
  }

  void deletitemWishList(String productid) async {
    emit(deletWishListLoading());
    var either = await delet.invok(productid);
    either.fold((Error) => emit(deletWishListError(fauilers: Error)),
        (response) {
      datawih = response.data!;
      emit(WishListSuccess(wish: response));
    });
  }
}
