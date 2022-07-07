import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

  final Function() onPressed;
  final String texto;

  const BotonAzul({ 
    required this.onPressed, 
    required this.texto,});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
            // side: BorderSide(color: Colors.red),//pinta el solo borde
          )),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          elevation: MaterialStateProperty.all<double>(2),
        ),
        child: Container(
          width: double.infinity,
          height: 55,
          child:  Center(
            child: Text(
              texto,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
