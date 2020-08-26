import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/components/cart_badge.dart';
import 'package:getx/controllers/product_controller.dart';
import 'package:getx/controllers/theme_controller.dart';
import 'package:getx/pages/comprar.dart';
import 'package:getx/pages/detalle.dart';
import 'package:getx/pages/pagar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cart Product"),
          actions: <Widget>[
            CartBadge(),
            GetBuilder<ThemeController>(
                init: ThemeController(),
                builder: (_) => Obx(
                      () => Switch(
                        value: _.isThemeDark,
                        onChanged: (value) => _.changeTheme(),
                      ),
                    ))
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
                                _productController.disminuir();
                              }),
                          Spacer(),
                          IconButton(
                              iconSize: 50,
                              color: Colors.green,
                              icon: Icon(
                                Icons.add_circle,
                              ),
                              onPressed: () {
                                _productController.incrementar();
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
