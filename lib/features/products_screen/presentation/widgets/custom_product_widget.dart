import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/domain/entity/ProductResponeEntity.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/cubit/ProductScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductWidget extends StatelessWidget {
  final ProductEntity productEntity;

  CustomProductWidget({
    required this.productEntity,
  });

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    return words.length <= 2 ? title : "${words.sublist(0, 2).join(' ')}..";
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    return words.length <= 4 ? description : "${words.sublist(0, 4).join(' ')}..";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primary.withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CachedNetworkImage(
                  imageUrl: productEntity.imageCover ?? '',
                  height: 125.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
Positioned(
                  top: 8.h,
                  right: 10.w,
                  child: HeartButton(onTap: () {
                    productScreenViewModel.get(context).AddWishList(productEntity.id??'');
                  }),
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateTitle(productEntity.title ?? ''),
                    style: getMediumStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    truncateDescription(productEntity.description ?? ""),
                    style: getRegularStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "EGP ${productEntity.price ?? ''}",
                    style: getRegularStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Review (${productEntity.ratingsAverage ?? ''})",
                            style: getRegularStyle(
                              color: ColorManager.textColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          const Icon(
                            Icons.star_rate_rounded,
                            color: ColorManager.starRateColor,
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            productScreenViewModel.get(context)..AddtoCart(productEntity.id??'');
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.primary,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
