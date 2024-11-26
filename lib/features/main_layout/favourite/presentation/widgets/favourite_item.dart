import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/WishListViewModel.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item_details.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/cubit/ProductScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem({super.key, required this.wish});
  WishListEntity wish;
  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    return words.length <= 2 ? title : "${words.sublist(0, 2).join(' ')}..";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s135.h,
      padding: EdgeInsets.only(right: AppSize.s8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16.r),
          border: Border.all(color: ColorManager.primary.withOpacity(.3))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                border:
                    Border.all(color: ColorManager.primary.withOpacity(.6))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s16.r),
              child: CachedNetworkImage(
                width: AppSize.s120.w,
                height: AppSize.s135.h,
                fit: BoxFit.cover,
                imageUrl: wish.imageCover ?? '',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: ColorManager.primary,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Text(
                truncateTitle(
                  wish.title ?? '',
                ),
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
              )),
              Flexible(
                  child: Text(
                truncateTitle("${wish.price}"),
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
              )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HeartButton(onTap: () {
                WishListViewmodel.Get(context)
                  ..deletitemWishList(wish.id ?? '');
              }),
              SizedBox(height: AppSize.s14.h),
              AddToCartButton(
                onPressed: () {
                  productScreenViewModel.get(context)..AddtoCart(wish.id ?? '');
                },
                text: AppConstants.addToCart,
              )
            ],
          )
        ],
      ),
    );
  }
}
