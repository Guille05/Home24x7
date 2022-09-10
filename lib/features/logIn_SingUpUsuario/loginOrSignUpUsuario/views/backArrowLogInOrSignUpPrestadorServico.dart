import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../logIn_SingUpPrestador/veryFirstScreen/veryFirstScreenUserType.dart';


class BackArrowLogInOrSignUpPrestadorServico extends StatelessWidget {
  const BackArrowLogInOrSignUpPrestadorServico({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: () {
      Navigator.of(context).pop();
    } ,
      icon:  Icon(Icons.arrow_back, color: Color(0xff4cf2c7), size: 30.0),
      label: Text(''),
    );
  }
}
