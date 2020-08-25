import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/product_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    onPressed: () => print('cart')),
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
            width: 200,
            height: 200,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Image.network(
                            'https://wongfood.vteximg.com.br/arquivos/ids/159244-1000-1000/Zanahoria-Wong-4047.jpg?v=636089432532430000',
                            fit: BoxFit.cover,
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
                              onPressed: () => _productController.disminuir()),
                          Spacer(),
                          IconButton(
                              iconSize: 50,
                              color: Colors.green,
                              icon: Icon(
                                Icons.add_circle,
                              ),
                              onPressed: () =>
                                  _productController.incrementar()),
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
