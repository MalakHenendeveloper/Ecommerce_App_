import 'package:ecommerce_app/core/injactable/injactable.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/Custtomalart.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sigup/cubit/RegisterState.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sigup/cubit/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/main_text_field.dart';
import '../../../../../core/widget/validators.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
var viewmodel=getIt<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, Registerstate> (
      bloc: viewmodel,
      listener: (context, state) {
      if (state is RegisterLoading) {
        AlartDilog.showloading(context: context, massege: "Loading ...");
      } else if(state is RegisterError){
     AlartDilog.hidelogin(context);
     AlartDilog.massege(context: context, massge: state.fauilers.ErrorMesage, title: 'Error', nameactions: "OK",
     action: (){
      Navigator.pop(context);
     });
      }
      else if(state is RegisterSuccess){
        AlartDilog.hidelogin(context);
        AlartDilog.massege(context: context, massge: "Register Successfully", title: "Success",nameactions: "OK",
         action: (){
      Navigator.pushNamed(context, Routes.signInRoute);
     }
        );
      }
      }, 
      child:    Scaffold(
          backgroundColor: ColorManager.primary,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                      controller: viewmodel.name,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,                      controller: viewmodel.phone,

                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                                            controller: viewmodel.email,

                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                                            controller: viewmodel.password,

                    ),  SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your repassword',
                      backgroundColor: ColorManager.white,
                      label: 'repassword',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                                            controller: viewmodel.repassword,

                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary, fontSize: AppSize.s20),
                          onTap: () {
                            viewmodel.register();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
     ,
    );
  }
}
