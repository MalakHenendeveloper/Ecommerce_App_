import 'package:ecommerce_app/core/injactable/injactable.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/Custtomalart.dart';
import 'package:ecommerce_app/features/cart/screens/Cubit/CartScreenState.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Cubit/CartScreenViewModel.dart';
class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  var viewmodel = getIt<CartScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartScreenViewModel, cartScreenState>(
      listener: (context, state) {
        if (state is UpdatecartScreenError) {
    AlartDilog.massege(context: context, massge: state.fauilers.ErrorMesage , title: "error");

        } else if (state is getcartScreenSuccess) {
         viewmodel.getCart();
        }
      },
      child: BlocBuilder<CartScreenViewModel, cartScreenState>(
        bloc: viewmodel..getCart(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(IconsAssets.icSearch),
                    color: ColorManager.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(IconsAssets.icCart),
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
            body
                : state is getcartScreenSuccess
                ? Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => CartItemWidget(
                        Product: state.getCartResponseEntity.data!.products![index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(height: AppSize.s12.h),
                      itemCount: state.getCartResponseEntity.data!.products!.length,
                    ),
                  ),
                  TotalPriceAndCheckoutBotton(
                    totalPrice: state.getCartResponseEntity.data!.totalCartPrice!.toInt(),
                    checkoutButtonOnTap: () {},
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

/*class CartScreen extends StatelessWidget {
   CartScreen({super.key});
var viewmodel=getIt<CartScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel, cartScreenState>(
      bloc: viewmodel..getCart(),
      builder: (context, state) {

        return    Scaffold(
          appBar: AppBar(
            title: Text(
              'Cart',
              style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(
                    IconsAssets.icSearch,
                  ),
                  color: ColorManager.primary,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(IconsAssets.icCart),
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
          body:state is deletecartScreenLoading
          ? Center(child: CircularProgressIndicator()):
          state is getcartScreenSuccess?
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Column(
              children: [
                Expanded(
                  // the list of cart items ===============
                  child: ListView.separated(
                    itemBuilder: (context, index) => CartItemWidget(
                    Product:state.getCartResponseEntity.data!.products![index] ,
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.s12.h),
                    itemCount: state.getCartResponseEntity.data!.products!.length,
                  ),
                ),
                // the total price and checkout button========
                TotalPriceAndCheckoutBotton(
                  totalPrice: state.getCartResponseEntity.data!.totalCartPrice!.toInt(),
                  checkoutButtonOnTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ): Center(child: CircularProgressIndicator(),)
        );


      }
    );
  }
}*/
