import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/Custtomalart.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/WishListViewModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/WishListstate.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewmodel = WishListViewmodel.Get(context);
    return BlocBuilder<WishListViewmodel, WishListState>(
      bloc: WishListViewmodel.Get(context)..getWishList(),
      builder: (context, state) {
        if (state is WishListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WishListSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.s14.w,
              vertical: AppSize.s10.h,
            ),
            child: ListView.builder(
              itemCount: state.wish.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                  child: FavoriteItem(
                    wish: state.wish.data![index],
                  ),
                );
              },
            ),
          );
        }
        // الحالة الافتراضية عند عدم وجود بيانات أو إذا كانت الحالة مختلفة
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
