import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/domain/entity/BrandsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
   CustomBrandWidget({super.key, required this.brandsEntity});
BrandsEntity brandsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
           height: 80,
           width: 80,
           fit: BoxFit.cover,
           imageUrl: brandsEntity.image??'',
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
      ],
    );
  }
}


     