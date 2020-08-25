import 'package:flutter/material.dart';

class Comprar extends StatelessWidget {
  const Comprar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Producto comprado'),
      ),
    );
  }
}
