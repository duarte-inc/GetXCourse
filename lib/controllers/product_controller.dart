import 'package:get/get.dart';

class ProductController extends GetxController {
  int _countProduct = 0;
  int get countProduct => _countProduct;

  void incrementar() {
    _countProduct++;
    update();
  }

  void disminuir() {
    _countProduct--;
    update();
  }
}
