import 'package:anak2ulogin/widgets/LoginSignUp.dart';
import 'package:flutter/material.dart';


void main (){
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Anak2U Login UI",
      home: LoginSignUp(),

    );
  }
}
