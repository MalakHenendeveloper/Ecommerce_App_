import 'package:ecommerce_app/core/injactable/injactable.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/Custtom_Shered_prefrence.dart';
import 'package:ecommerce_app/core/widget/bloc.dart';
import 'package:ecommerce_app/features/cart/screens/Cubit/CartScreenViewModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/WishListViewModel.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/cubit/ProductScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CusttomSharedPrefrence.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  var Token = CusttomSharedPrefrence.GetData(key: "token");
  String route;
  if (Token == null) {
    route = Routes.signInRoute;
  } else {
    route = Routes.mainRoute;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<productScreenViewModel>()),
        BlocProvider(create: (context) => getIt<CartScreenViewModel>()),
        BlocProvider(create: (context) => getIt<WishListViewmodel>())
      ],
      child: MainApp(
        route: route,
      )));
} //01203263950

//flutter packages pub run build_runner build   flutter packages pub run build_runner watch
class MainApp extends StatelessWidget {
  MainApp({super.key, required this.route});
  String route;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: route,
      ),
    );
  }
}
