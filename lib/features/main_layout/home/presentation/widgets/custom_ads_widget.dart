import 'dart:async';

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAdsWidget extends StatelessWidget {
 
  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

   CustomAdsWidget({
    super.key,
  
   
  });

  @override
  Widget build(BuildContext context) {
    return 
    ImageSlideshow(

          initialPage: 0,
indicatorBottomPadding: 20.h,
          indicatorColor: Colors.blue,

          indicatorBackgroundColor: Colors.grey,

          children:adsImages.map((url)=> Padding(padding: EdgeInsets.all(8),
           child: Image.asset(url,
            fit: BoxFit.fill, 
            width: 210.w,
            height: 210.h,),)).toList(),


          
          autoPlayInterval: 3000,

          isLoop: true,
        );


//

  }
}
/*
 Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            child: Image.asset(
              height: 210.h,
              width: double.infinity,
              adsImages[currentIndex],
              key: ValueKey<int>(currentIndex),
            ),
          ),
          SizedBox(
            height: 210.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: adsImages.map((image) {
                int index = adsImages.indexOf(image);
                return Container(
                  width: 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 4.0.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? ColorManager.primary
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );




 */