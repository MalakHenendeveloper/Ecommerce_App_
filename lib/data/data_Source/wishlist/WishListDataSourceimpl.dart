import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/APiManger.dart';
import 'package:ecommerce_app/core/api/Endpoints.dart';
import 'package:ecommerce_app/core/widget/Custtom_Shered_prefrence.dart';
import 'package:ecommerce_app/data/Models/WishListResponseDto.dart';
import 'package:ecommerce_app/data/data_Source/wishlist/WishlistDataSource.dart';
import 'package:ecommerce_app/domain/UseCase/fauiler.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishListDataSource)
class WishListDataSOurceImp implements WishListDataSource {
  Apimanger apimanger;

  WishListDataSOurceImp({required this.apimanger});
  var token = CusttomSharedPrefrence.GetData(key: 'token');
  @override
  Future<Either<Fauilers, WishListResponseEntity>> addwishlist(
      String productid) async {
    try {
      var response = await apimanger.PostDate(Endpoints.wishlist,
          body: {"productId": productid}, headers: {"token": token.toString()});

      var addWishList = WishListResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(addWishList);
      } else {
        return Left(ServerError(ErrorMesage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMesage: "Please CheckInternrt"));
    }
  }

  Future<Either<Fauilers, WishListResponseEntity>> deletewishlist(
      String productid) async {
    try {
      var response = await apimanger.Deletedata(
          "${Endpoints.wishlist}/$productid",
          headers: {'token': token.toString()});
      var responsewishList = WishListResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(responsewishList);
      } else {
        return Left(ServerError(ErrorMesage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMesage: e.toString()));
    }
  }

  @override
  Future<Either<Fauilers, WishListResponseEntity>> getwishlist() async {
    try {
      var response = await apimanger
          .getDate(Endpoints.wishlist, headers: {"token": token.toString()});
      var getResponse = WishListResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(getResponse);
      } else {
        return Left(ServerError(ErrorMesage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMesage: e.toString()));
    }
  }
}
