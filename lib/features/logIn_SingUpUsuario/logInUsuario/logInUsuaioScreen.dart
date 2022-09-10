import 'package:home24x7/features/logIn_SingUpUsuario/logInUsuario/views/logInBodyUsuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LogInUsuaioScreen extends StatelessWidget {
   LogInUsuaioScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInBodyUsuario(),
    );
  }
}

