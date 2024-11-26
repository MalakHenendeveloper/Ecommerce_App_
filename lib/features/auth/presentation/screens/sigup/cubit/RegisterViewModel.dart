import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/UseCase/auth/RegisterUSecase.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sigup/cubit/RegisterState.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterViewModel extends Cubit<Registerstate>{
  RegisterViewModel({required this.usecase}):super(RegisterInaital());
  Registerusecase usecase;
var name=TextEditingController(text: "andreo");
var email=TextEditingController(text: "anoo589280@gmail.com");
var password=TextEditingController(text: '58928014los');
var repassword=TextEditingController(text: "58928014los");
var phone=TextEditingController(text: "01887799446");
void  register()async{
    emit(RegisterLoading());
    var either=await    usecase.invok(name.text, email.text, password.text, repassword.text, phone.text);
either.fold((error){
  emit(RegisterError(fauilers: error));
}, (response){emit(RegisterSuccess(register: response));});
  }
}