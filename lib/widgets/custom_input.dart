import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icono;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({ 
    required this.icono, 
    required this.placeholder, 
    required this.textController, 
    this.keyboardType = TextInputType.text, 
    this.isPassword = false,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(bottom: 5, left: 5, top: 5, right: 25),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: Offset(0, 5), blurRadius: 5)]),
        child:  TextField(
            controller: textController,
            autocorrect: false, // autocompletar
            keyboardType: keyboardType,
            obscureText: isPassword, // contraseña
            decoration:  InputDecoration(
              prefixIcon: Icon(icono), //Icons.mail_outline
              focusedBorder: InputBorder.none, // dehabilita la linea de enfasis inferior de la caja de texto
              border: InputBorder.none, // dehabilita la linea de enfasis inferior de la caja de texto
              hintText: placeholder, // es comko el placeholder
            )),
      ),
    );
  }
}
