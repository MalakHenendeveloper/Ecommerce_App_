import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/domain/entity/CateegoryResonseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
   CustomCategoryWidget({super.key, required this.categoryEntity});
CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    CachedNetworkImage(
  height: 100,
  width: 100,
  fit: BoxFit.cover,
  imageUrl: categoryEntity.image??'',
  placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator()),
  errorWidget: (context, url, error) =>
      const Center(child: Icon(Icons.error)),
  imageBuilder: (context, imageProvider) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  },
),
 Text(categoryEntity.name??'',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        )

       /* ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              ImageAssets.categoryHomeImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "men's fashion",
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),*/
      ],
    );
  }
}
