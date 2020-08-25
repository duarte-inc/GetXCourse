import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/product_controller.dart';
import 'package:getx/pages/comprar.dart';
import 'package:getx/pages/detalle.dart';
import 'package:getx/pages/pagar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    snackBar({title, message, color}) {
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: color,
          colorText: Colors.white);
    }

    dialog() {
      Get.dialog(AlertDialog(
        title: Text('Producto exedido'),
        actions: <Widget>[
          FlatButton(onPressed: () => Get.back(), child: Text('Ok'))
        ],
      ));
    }

    bootomShet() {
      Get.bottomSheet(Container(
        color: Colors.white,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 5),
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Icon(Icons.close), onPressed: () => Get.back()))),
            Icon(
              Icons.shopping_cart,
              size: 43,
            ),
            Text(
              'cantidad de productos ${_productController.countProduct}',
              style: TextStyle(color: Colors.red, fontSize: 26),
            )
          ],
        ),
      ));
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cart Product"),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () => bootomShet()),
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6)),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: GetBuilder<ProductController>(
                      init: ProductController(),
                      builder: (_) => Text(
                        _.countProduct.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            FlatButton(
                                color: Colors.green,
                                onPressed: () {
                                  Get.to(Detalle());
                                },
                                child: Text(
                                  'Detalle',
                                  style: TextStyle(color: Colors.white),
                                )),
                            SizedBox(
                              width: 3,
                            ),
                            FlatButton(
                                color: Colors.orange,
                                onPressed: () {
                                  Get.off(Comprar());
                                },
                                child: Text(
                                  'Comprar',
                                  style: TextStyle(color: Colors.white),
                                )),
                            SizedBox(
                              width: 3,
                            ),
                            FlatButton(
                                color: Colors.red,
                                onPressed: () {
                                  Get.offAll(Pagar());
                                },
                                child: Text(
                                  'Pagar',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            // Get.to(ProductDetails());
                          },
                          child: Container(
                            child: Image.network(
                              'https://wongfood.vteximg.com.br/arquivos/ids/159244-1000-1000/Zanahoria-Wong-4047.jpg?v=636089432532430000',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          IconButton(
                              iconSize: 50,
                              color: Colors.red,
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                if (_productController.countProduct >= 1) {
                                  snackBar(
                                      title: 'Disminuir',
                                      color: Colors.red,
                                      message: 'Se disminuyo el producto');
                                  _productController.disminuir();
                                } else {
                                  dialog();
                                }
                              }),
                          Spacer(),
                          IconButton(
                              iconSize: 50,
                              color: Colors.green,
                              icon: Icon(
                                Icons.add_circle,
                              ),
                              onPressed: () {
                                if (_productController.countProduct < 10) {
                                  snackBar(
                                      title: 'Aumentar',
                                      color: Colors.green,
                                      message: 'Se Aumento el producto');
                                  _productController.incrementar();
                                } else {
                                  dialog();
                                }
                              }),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
