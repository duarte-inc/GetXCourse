import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/product_controller.dart';

class CartBadge extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
            iconSize: 40,
            icon: Icon(Icons.shopping_cart),
            onPressed: () => _productController.showBottomSheet()),
        Positioned(
          right: 11,
          top: 11,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(6)),
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
        ),
      ],
    );
  }
}
