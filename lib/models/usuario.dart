import 'package:flutter/material.dart';

class Usuario {
  final String? uid;
  final bool online;
  final String? nombre;
  final String? email;

  Usuario({this.online = false, this.nombre, this.email, this.uid});
}
