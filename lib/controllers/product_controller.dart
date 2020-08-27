import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  int _countProduct = 0;
  int get countProduct => _countProduct;

  void incrementar() {
    showSnackBar(
        title: 'Producto Agregado',
        message: 'se agrego el producto',
        color: Colors.green);
    _countProduct++;
    update();
  }

  void disminuir() {
    showSnackBar(
        title: 'Producto Disminuido',
        message: 'se agrego disminuyo el producto',
        color: Colors.red);
    _countProduct--;
    update();
  }

  void showSnackBar({String title, String message, Color color}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: color,
        duration: Duration(seconds: 4),
        colorText: Colors.white);
  }
}
