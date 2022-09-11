import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class GenericLogSingUpButton extends StatelessWidget {
  final String buttonText;
  final RoundedLoadingButtonController controller;
  final void Function() goNextScreen;
  const GenericLogSingUpButton({Key? key,
    required this.buttonText,
    required this.goNextScreen,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
        ),

        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            'Donation Recipient',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      onPressed: () {
        goNextScreen;
      },
      style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),),
    );
  }
}
