import 'dart:developer';
import 'dart:io';

import 'package:chat/widgets/chat_mensajes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _texController = TextEditingController();
  final _focusNode = FocusNode();
  bool isEscrcibiendo = false;

  List<ChatMensaje> _mensajes = [
    // ChatMensaje(texto: 'Hola Mundo', uId: '123'),
    // ChatMensaje(texto: 'asdd Mundo', uId: '2'),
    // ChatMensaje(texto: 'Hola asddd', uId: '123'),
    // ChatMensaje(texto: 'a as', uId: '2'),
    // ChatMensaje(texto: 'd', uId: '123'),
    // ChatMensaje(texto: 'Hoddds  dwsddds o', uId: '2'),
    // ChatMensaje(texto: 'Ho33o', uId: '2'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _mensajes.length,
              itemBuilder: (_, i) => _mensajes[i],
              reverse: true,
            )),
            Divider(height: 10, color: Colors.blue),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.white, //Colors.teal
      title: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(
              'Us',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          const Text(
            'Usuario',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _texController,
            onSubmitted: (_) {
              _contenidoSubmit(_);
            },
            onChanged: (String texto) {
              setState(() {
                if (texto.trim().length > 0) {
                  isEscrcibiendo = true;
                } else {
                  isEscrcibiendo = false;
                }
              });
              // cuando hay un valor para poder postear
            },
            decoration: InputDecoration.collapsed(hintText: 'Enviar Mensaje'),
            focusNode: _focusNode,
          )),
          //boton de enviar
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(child: Text('Enviar'), onPressed: () {})
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          onPressed: isEscrcibiendo ? () => _contenidoSubmit(_texController.text.trim()) : null,
                        ),
                      ),
                    ))
        ],
      ),
    ));
  }

  _contenidoSubmit(String texto) {
    if (texto.length == 0) return;

    // log('$texto');
    _texController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMensaje(
      uId: '123',
      texto: texto,
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 300)),
    );
    _mensajes.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      isEscrcibiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: off del socket

    for (ChatMensaje mensaje in _mensajes) {
      mensaje.animationController.dispose();
    }

    super.dispose();
  }
}
