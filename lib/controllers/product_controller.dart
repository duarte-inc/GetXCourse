import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/theme_controller.dart';

class ProductController extends GetxController {
  int _countProduct = 0;
  int get countProduct => _countProduct;

  void incrementar() {
    showDialog(
        title: 'producto añadido',
        assets: 'assets/flare_success.flr',
        animation: 'animation');
    showSnackBar(
        title: 'Producto Agregado',
        message: 'se agrego el producto',
        color: Colors.green);
    _countProduct++;
    update();
  }

  void disminuir() {
    showDialog(
        title: 'producto quitado',
        assets: 'assets/flare_error.flr',
        animation: 'action');
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

  void showBottomSheet() {
    Get.bottomSheet(GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (_) => Container(
        color: _.isThemeDark ? Colors.black : Colors.white,
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: Text('Contador'),
              subtitle: Text(_countProduct.toString()),
              trailing: Icon(Icons.dashboard),
            ),
            ListTile(
              title: Text('Tema Actual'),
              subtitle: _.isThemeDark ? Text('Oscuro') : Text('Claro'),
              trailing: Icon(Icons.threesixty),
            ),
            ListTile(
              title: Text('Ruta Actual'),
              subtitle: Text(Get.currentRoute),
              trailing: Icon(Icons.accessible),
            ),
          ],
        ),
      ),
    ));
  }

  void showDialog({String title, String assets, String animation}) {
    Get.dialog(Container(
      child: AlertDialog(
        title: Text(title),
        content: Container(
          width: 100,
          height: 100,
          child: FlareActor(
            assets,
            fit: BoxFit.cover,
            animation: animation,
          ),
        ),
        actions: <Widget>[
          FlatButton(onPressed: () => Get.back(), child: Text('Ok'))
        ],
      ),
    ));
  }
}
