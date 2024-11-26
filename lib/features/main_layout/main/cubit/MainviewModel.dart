import 'package:ecommerce_app/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_tab.dart';
import 'package:ecommerce_app/features/main_layout/main/cubit/mainState.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products_screen/presentation/screens/products_screen.dart';

class Mainviewmodel extends Cubit<Mainstate>{
  Mainviewmodel():super(MainstateInatail());
   int currentIndex = 0;
  List<Widget> tabs = [
     HomeTab(),
    ProductsScreen(),
     FavouriteScreen(),
     ProfileTab(),
  ];
  
  changeSelectedIndex(int selectedIndex) {
    emit(MainstateInatail());
      currentIndex = selectedIndex;
    emit(ChangeSelectedIndex());
  }
}