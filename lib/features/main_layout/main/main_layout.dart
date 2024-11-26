import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/main/cubit/MainviewModel.dart';
import 'package:ecommerce_app/features/main_layout/main/cubit/mainState.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/presentation/home_tab.dart';

class MainLayout extends StatelessWidget {
   MainLayout({super.key});
var viewmodel=Mainviewmodel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Mainviewmodel, Mainstate>(
      bloc: viewmodel,
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeScreenAppBar(),
          extendBody: false,
          body:viewmodel. tabs[viewmodel. currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: BottomNavigationBar(
                currentIndex:viewmodel. currentIndex,
                onTap: (value) =>viewmodel. changeSelectedIndex(value),
                backgroundColor: ColorManager.primary,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: ColorManager.primary,
                unselectedItemColor: ColorManager.white,
                showSelectedLabels: false, // Hide selected item labels
                showUnselectedLabels: false, // Hide unselected item labels
                items: [
                  // Build BottomNavigationBarItem widgets for each tab
                  CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
                  CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
                  CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
                  CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;
  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath), // Inactive icon image
            color: ColorManager.white, // Inactive icon color
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white, // Background of active icon
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager
                  .primary, // Active icon imagecolor: ColorManager.primary, // Active icon color
            ),
          ),
        );
}
