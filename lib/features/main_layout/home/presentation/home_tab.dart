import 'package:ecommerce_app/core/injactable/injactable.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/widget/product_card.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/HomeTabState.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/HomeTabViewModel.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});



Hometabviewmodel viewmodel=getIt<Hometabviewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Hometabviewmodel, HomeTabState>(
      bloc: viewmodel..getAllCategory()..getAllBrands(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAdsWidget(
              ),

              Column(
                children: [
                  CustomSectionBar(sectionNname: 'Categories', function: () {}),
                  state is CategoriesStateLoading
                      ?
                  CircularProgressIndicator():
                  //or viewmodel.categorylist.isnotempty
                  SizedBox(
                    height: 270.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return  CustomCategoryWidget(categoryEntity: viewmodel.categoriesList![index],);
                      },
                      itemCount: viewmodel.categoriesList!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                SizedBox(height: 12.h),
 

 
  CustomSectionBar(sectionNname: 'Brands', function: () {}),
   state is  BrandstateLoading?

CircularProgressIndicator():
   SizedBox(
     height: 270.h,
     child: GridView.builder(
       scrollDirection: Axis.horizontal,
       itemBuilder: (context, index) {
         return  CustomBrandWidget(brandsEntity: viewmodel.BrandsList![index],);
       },
       itemCount: viewmodel.BrandsList!.length,
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
       ),
     ),
   ),
CustomSectionBar(
  sectionNname: 'Most Selling Products',
  function: () {},
),
SizedBox(
  height: 360.h,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return const ProductCard(
        title: "Nike Air Jordon",
        description:
            "Nike is a multinational corporation that designs, develops, and sells athletic footwear, apparel, and accessories",
        rating: 4.5,
        price: 1100,
        priceBeforeDiscound: 1500,
        image: ImageAssets.categoryHomeImage,
      );
    },
    itemCount: 20,
  ),
),

                  SizedBox(height: 12.h),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
