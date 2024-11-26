import 'package:ecommerce_app/core/injactable/injactable.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/Custtomalart.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/cubit/ProductScreenState.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/cubit/ProductScreenViewModel.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
   ProductsScreen({super.key});
var viewmodel=getIt<productScreenViewModel>();
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<productScreenViewModel,ProductScreenState>(
        bloc: viewmodel..getproduct(),
        builder: (context ,state) {
        return Scaffold(

          body: state is ProductScreenStateSuccess?
            Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
          children: [
          Expanded(
          child: (
          GridView.builder(
          itemCount: viewmodel.ProductList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 7 / 9,
          ),
          itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
          Navigator.of(context).push( MaterialPageRoute(
      builder: (_)=>ProductDetails(details: viewmodel.ProductList[index],)));
},
            child: CustomProductWidget(
            productEntity: viewmodel.ProductList[index],
            ),
          );
          },
          scrollDirection: Axis.vertical,
          )
          ),
          )
          ],
          ),
          ):Center(child: CircularProgressIndicator())


          );
      }
    );
  }
}
