import 'package:flutter/material.dart';

class Detalle extends StatelessWidget {
  const Detalle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Detalle de producto'),
      ),
    );
  }
}
