import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String titulo;

  const Logo({ required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 70),
        width: 170,
        child: Column(
          children:  [
            const Image(
              image: AssetImage('assets/tag-logo.png'),
            ),
            const SizedBox(height: 20),
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 30,
                // fontWeight: FontWeight.bold,
                // color: Colors.,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
