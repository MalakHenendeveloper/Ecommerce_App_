import 'package:shared_preferences/shared_preferences.dart';

class CusttomSharedPrefrence {
  static late SharedPreferences shared;
  static init()async{
    shared= await SharedPreferences.getInstance();
  }
  static   Future<bool> SaveData({
    required String key, required dynamic value
}){
if(value is int){
  return shared.setInt(key, value);
}else if(value is double){

  return shared .setDouble(key, value);
}
else if(value is String ){
  return shared.setString(key, value);
}
else {
return shared.setBool(key, value);
}



  }


  static  Object? GetData({required String key}){
    return shared.get(key);
  }
  static Future<bool>  RemoveData({required String key}){
    return shared.remove(key);
  }
}