import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/user_module/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [   
          IconButton(onPressed: () {
            usersViewModel.getUsers();
          }, icon: Icon(Icons.refresh)),
        ],
      ),
      body: _ui(usersViewModel),
    );
  }
}

_ui(UsersViewModel usersViewModel) {
  if (usersViewModel.loading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  if (usersViewModel.error != null) {
    return Center(
        child: Text(
      usersViewModel.error ?? "Error",
      style: TextStyle(color: Colors.black),
    ));
  }
  return ListView.builder(
    itemCount: usersViewModel.userList.length,
    physics: BouncingScrollPhysics(),
    itemBuilder: ((context, index) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: PhysicalModel(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Name: "+usersViewModel.userList[index].name,style: TextStyle(color: Colors.white,fontSize: 15),),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 5),
                    child: Text("Email: "+usersViewModel.userList[index].email,style: TextStyle(color: Colors.white),),
                  ),
                  Text("Phone: "+usersViewModel.userList[index].phone,style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
    )),
  );
}
