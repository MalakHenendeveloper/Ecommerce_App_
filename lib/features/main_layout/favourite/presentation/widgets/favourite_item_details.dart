import 'package:colornames/colornames.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/entity/WishListResponseEntity.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/custom_txt_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteItemDetails extends StatelessWidget {
   FavouriteItemDetails({required this.wish, super.key});
WishListEntity wish;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: wish.title??'',
          textStyle: getSemiBoldStyle(
              color: ColorManager.primaryDark, fontSize: AppSize.s18.sp),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: AppSize.s10.w),
              width: AppSize.s14.w,
              height: AppSize.s14.h,
              decoration: BoxDecoration(
                 shape: BoxShape.circle),
            ),
           /*
           *  CustomTextWgt(
              data: (product["color"] as Color).colorName,
              textStyle: getMediumStyle(
                  color: ColorManager.primaryDark, fontSize: AppSize.s14.sp),
            ),*/
          ],
        ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${wish.price}  ',
              textStyle: getSemiBoldStyle(
                      color: ColorManager.primaryDark, fontSize: AppSize.s18.sp)
                  .copyWith(
                letterSpacing: 0.17,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
