import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/user_module/view_models/user_view_model.dart';
import 'package:mvvm_with_provider/user_module/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersViewModel>(create: (_)=>UsersViewModel()),
      ],
      child: MaterialApp(        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen()
      ),
    );
  }
}

