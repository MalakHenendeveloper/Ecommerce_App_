import 'package:ecommerce_app/domain/entity/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity{
 

  LoginResponseDto({super.message, super.user, super.token});

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

}

class UserDto  extends UserEntity{


  UserDto({super.name, super.email, super.role});

  UserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

 
}
