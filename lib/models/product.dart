import 'package:get/get.dart';

class Product {
  final String name;
  final String image;
  final double price;
  RxInt quantity = 1.obs;

  Product(
      {required this.name,
      required this.image,
      required this.price,
      required this.quantity});
}
