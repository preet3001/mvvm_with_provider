import 'package:flutter/foundation.dart';
import 'package:mvvm_with_provider/user_module/models/user_model.dart';
import 'package:mvvm_with_provider/user_module/repo/api_client.dart';
import 'package:mvvm_with_provider/user_module/repo/user_service.dart';

class UsersViewModel extends ChangeNotifier {

  UsersViewModel(
    
  ){
    getUsers();
  }

  bool _loading = false;
  List<UserModel> _userList = [];
  String? _error;
  late UserModel _selectedUser;




  bool get loading => _loading;
  List<UserModel> get userList =>_userList;
  String? get error =>_error;
  UserModel get selectedUser => _selectedUser;


  setLoading(bool loading)async {
    _loading = loading;
    notifyListeners();
  }

  setUserList(List<UserModel> userList){
    _userList = userList;
  }

  setError(String error){
    _error = error;
  }

  setSelectedUser (UserModel userModel){
    _selectedUser = userModel;
  }

  getUsers()async {
    setLoading(true);
    Client client = Client();
    UserService userService = UserService(client: client.init());
    try {
      await userService.getUser().then((value) {
        setUserList(value);      
      },onError: (err){
        setError(err.toString());
      });
    } on Exception catch (e) {
      setError(e.toString());
    }
    setLoading(false);
  }
  
}