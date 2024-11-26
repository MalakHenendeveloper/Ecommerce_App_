// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_Source/auth/AuthDataSource.dart' as _i891;
import '../../data/data_Source/auth/AuthDataSourceImp.dart' as _i465;
import '../../data/data_Source/Cart/cartDataSource.dart' as _i494;
import '../../data/data_Source/Cart/CartDataSourceImp.dart' as _i689;
import '../../data/data_Source/Home/HomeDataSource.dart' as _i611;
import '../../data/data_Source/Home/HomeDataSourceImp.dart' as _i17;
import '../../data/data_Source/wishlist/WishlistDataSource.dart' as _i545;
import '../../data/data_Source/wishlist/WishListDataSourceimpl.dart' as _i939;
import '../../data/Reposetory/Authrepositoryimp.dart' as _i582;
import '../../data/Reposetory/CartRepositoryimp.dart' as _i383;
import '../../data/Reposetory/HomeRepositoryImp.dart' as _i750;
import '../../data/Reposetory/WishListRepositoryimpl.dart' as _i219;
import '../../domain/Reposetory/authRepository.dart' as _i889;
import '../../domain/Reposetory/CartRepository.dart' as _i448;
import '../../domain/Reposetory/HomeRepository.dart' as _i1029;
import '../../domain/Reposetory/WishListRepository.dart' as _i146;
import '../../domain/UseCase/auth/LoginUseCase.dart' as _i436;
import '../../domain/UseCase/auth/RegisterUSecase.dart' as _i494;
import '../../domain/UseCase/Cart/AddTocartUsecase.dart' as _i858;
import '../../domain/UseCase/Cart/deletecartUseCase.dart' as _i976;
import '../../domain/UseCase/Cart/getCart.dart' as _i124;
import '../../domain/UseCase/Cart/updatecartUsecase.dart' as _i225;
import '../../domain/UseCase/Home/BrandsUseCase.dart' as _i1032;
import '../../domain/UseCase/Home/CategoryUsecase.dart' as _i452;
import '../../domain/UseCase/Home/ProductUsecase.dart' as _i496;
import '../../domain/UseCase/wishlist/AddWishListUsecase.dart' as _i877;
import '../../domain/UseCase/wishlist/DeleteWishListUsecase.dart' as _i533;
import '../../domain/UseCase/wishlist/getWishListUseCase.dart' as _i957;
import '../../features/auth/presentation/screens/sigup/cubit/RegisterViewModel.dart'
    as _i312;
import '../../features/auth/presentation/signin/cubit/LoginViewModel.dart'
    as _i869;
import '../../features/cart/screens/Cubit/CartScreenViewModel.dart' as _i150;
import '../../features/main_layout/favourite/presentation/cubit/WishListViewModel.dart'
    as _i668;
import '../../features/main_layout/home/presentation/cubit/HomeTabViewModel.dart'
    as _i913;
import '../../features/products_screen/presentation/screens/cubit/ProductScreenViewModel.dart'
    as _i165;
import '../api/APiManger.dart' as _i697;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i697.Apimanger>(() => _i697.Apimanger());
    gh.factory<_i611.Homedatasource>(
        () => _i17.Homedatasourceimp(apimanger: gh<_i697.Apimanger>()));
    gh.factory<_i494.cartDataSource>(
        () => _i689.CartDataSourceImp(apimanger: gh<_i697.Apimanger>()));
    gh.factory<_i545.WishListDataSource>(
        () => _i939.WishListDataSOurceImp(apimanger: gh<_i697.Apimanger>()));
    gh.factory<_i891.Authdatasource>(
        () => _i465.Authdatasourceimp(apimanger: gh<_i697.Apimanger>()));
    gh.factory<_i1029.HomeRepository>(() =>
        _i750.Homerepositoryimp(homedatasource: gh<_i611.Homedatasource>()));
    gh.factory<_i448.cartRepository>(
        () => _i383.CartRepositoryImp(cart: gh<_i494.cartDataSource>()));
    gh.factory<_i146.WishListRepository>(() =>
        _i219.WishListRepositoryImpl(data: gh<_i545.WishListDataSource>()));
    gh.factory<_i976.DeleteCartUseCase>(
        () => _i976.DeleteCartUseCase(delet: gh<_i448.cartRepository>()));
    gh.factory<_i889.Authrepository>(() =>
        _i582.AuthrepositoryImp(authdatasource: gh<_i891.Authdatasource>()));
    gh.factory<_i533.Deletewishlistusecase>(() => _i533.Deletewishlistusecase(
        wishListRepository: gh<_i146.WishListRepository>()));
    gh.factory<_i858.AddToCartUseCase>(() =>
        _i858.AddToCartUseCase(homeRepository: gh<_i1029.HomeRepository>()));
    gh.factory<_i1032.Brandsusecase>(() =>
        _i1032.Brandsusecase(homeRepository: gh<_i1029.HomeRepository>()));
    gh.factory<_i452.Categoryusecase>(() =>
        _i452.Categoryusecase(homeRepository: gh<_i1029.HomeRepository>()));
    gh.factory<_i496.ProductUseCase>(() =>
        _i496.ProductUseCase(homeRepository: gh<_i1029.HomeRepository>()));
    gh.factory<_i913.Hometabviewmodel>(() => _i913.Hometabviewmodel(
          categoryusecase: gh<_i452.Categoryusecase>(),
          brandsusecase: gh<_i1032.Brandsusecase>(),
        ));
    gh.factory<_i877.AddWishListUsecase>(
        () => _i877.AddWishListUsecase(add: gh<_i146.WishListRepository>()));
    gh.factory<_i225.UpdateCountUseCase>(
        () => _i225.UpdateCountUseCase(cart: gh<_i448.cartRepository>()));
    gh.factory<_i124.GetcartUseCase>(
        () => _i124.GetcartUseCase(get: gh<_i448.cartRepository>()));
    gh.factory<_i957.getWishListUsecase>(
        () => _i957.getWishListUsecase(get: gh<_i146.WishListRepository>()));
    gh.factory<_i436.Loginusecase>(
        () => _i436.Loginusecase(authrepository: gh<_i889.Authrepository>()));
    gh.factory<_i494.Registerusecase>(() =>
        _i494.Registerusecase(authrepository: gh<_i889.Authrepository>()));
    gh.factory<_i150.CartScreenViewModel>(() => _i150.CartScreenViewModel(
          usecase: gh<_i124.GetcartUseCase>(),
          deleteUseCase: gh<_i976.DeleteCartUseCase>(),
          update: gh<_i225.UpdateCountUseCase>(),
        ));
    gh.factory<_i869.Loginviewmodel>(
        () => _i869.Loginviewmodel(loginusecase: gh<_i436.Loginusecase>()));
    gh.factory<_i165.productScreenViewModel>(() => _i165.productScreenViewModel(
          useCase: gh<_i496.ProductUseCase>(),
          Addtocart: gh<_i858.AddToCartUseCase>(),
          addWishList: gh<_i877.AddWishListUsecase>(),
        ));
    gh.factory<_i668.WishListViewmodel>(() => _i668.WishListViewmodel(
          get: gh<_i957.getWishListUsecase>(),
          delet: gh<_i533.Deletewishlistusecase>(),
        ));
    gh.factory<_i312.RegisterViewModel>(
        () => _i312.RegisterViewModel(usecase: gh<_i494.Registerusecase>()));
    return this;
  }
}
