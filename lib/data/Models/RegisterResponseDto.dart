import 'package:ecommerce_app/domain/entity/RegisterResponseEntity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  String? statusMsg;

  RegisterResponseDto({super.message, super.user, super.token, this.statusMsg});

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? new UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserDto extends UserEntity {
  UserDto({super.name, super.email, super.role});

  UserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
