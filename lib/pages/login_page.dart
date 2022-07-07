import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:chat/widgets/Boton_azul.dart';
import 'package:chat/widgets/Labels.dart';
import 'package:chat/widgets/Logo.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final tamanio = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: FadeInDown(
              child: Container(
                // color: Colors.red,
                height: tamanio.height * 0.95,
                // width: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Logo(titulo: 'Meseenger'),
                    _Form(),
                    Labels(ruta:'register', isRegister: true,),
                    const Text(
                      'Términos y condiciones',
                      style: TextStyle(
                        // fontSize: ,
                        fontWeight: FontWeight.w300,
                        // color: Colors.,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icono: Icons.mail,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icono: Icons.lock,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          //TODO crear boton
          BotonAzul(
            texto: 'Ingresar',
            onPressed: () {
              log('${emailCtrl.text}');
              log('${passCtrl.text}');
            },
          ),
        ],
      ),
    );
  }
}


// const Icon(
//                   Icons.done,
//                   color: Colors.white,
//                   size: 40,
//                 ),