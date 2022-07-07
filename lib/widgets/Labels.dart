import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final bool isRegister;

  const Labels({required this.ruta,  this.isRegister = false,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           Text((isRegister)
            ? 'No Tienes Cuenta ?'
            : '',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta); // remplazo la ruta actual por lo cual no se puede volver atras
            },
            child: Text( (isRegister)
              ? 'Crearme una cuenta'
              : 'Volver',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
