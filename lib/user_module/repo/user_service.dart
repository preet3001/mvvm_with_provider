import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mvvm_with_provider/user_module/models/user_model.dart';

class UserService {
  Dio client;
  UserService({
    required this.client,
  });

  Future<List<UserModel>> getUser() async {
    try {
      Response r = await client.get("/users");
      if(r.statusCode==200){
        return userModelFromJson(jsonEncode(r.data));
      } else{
        return Future.error("Some thing Went Wrong");
      }
    } on DioError catch (e) {    
      return Future.error(e.message);
    }
  }
}
