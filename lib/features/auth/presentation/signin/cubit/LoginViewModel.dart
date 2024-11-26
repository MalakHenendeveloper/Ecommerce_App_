import 'package:ecommerce_app/domain/UseCase/auth/LoginUseCase.dart';
import 'package:ecommerce_app/features/auth/presentation/signin/cubit/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class Loginviewmodel extends Cubit<Loginstate>{
  Loginviewmodel({required this.loginusecase}):super(LoginInatial());
  Loginusecase loginusecase;
 var email=TextEditingController(text: "anoo589280@gmail.com");
var password=TextEditingController(text: '58928014los');
  void login()async{
    emit(LoginLoading());
   var either= await loginusecase.invok(email.text, password.text);
   either.fold((error){
    emit(LoginError(fauilers: error));
   }, (response){
    emit(LoginSuccess(loginResponseEntity: response));
   });
  }
}