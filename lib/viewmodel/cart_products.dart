import 'package:flutter_login/models/Product.dart';
import 'package:get/get.dart';

class Cartproducts extends GetxController {
  RxDouble totalPrice = 0.00.obs;

  final RxList<Product> products = [
    Product(
        name: "Patas de King Crab de Alaska",
        image: "images/product1.webp",
        price: 45.56,
        quantity: 1.obs),
    Product(
        name: "Alitas de pollo",
        image: "images/product2.webp",
        price: 323.44,
        quantity: 1.obs),
    Product(
        name: "SALCHICHAS DE ATÚN",
        image: "images/product3.webp",
        price: 183.5,
        quantity: 2.obs),
    Product(
        name: "Patas de King Crab de Alaska",
        image: "images/product4.webp",
        price: 334.66,
        quantity: 1.obs),
    Product(
        name: "Patas de King Crab de Alaska",
        image: "images/product1.webp",
        price: 45.56,
        quantity: 1.obs),
    Product(
        name: "Alitas de pollo",
        image: "images/product2.webp",
        price: 323.44,
        quantity: 1.obs),
    Product(
        name: "SALCHICHAS DE ATÚN",
        image: "images/product3.webp",
        price: 183.5,
        quantity: 1.obs),
    Product(
        name: "Patas de King Crab de Alaska",
        image: "images/product4.webp",
        price: 334.66,
        quantity: 1.obs),
    Product(
        name: "Patas de King Crab de Alaska",
        image: "images/product1.webp",
        price: 45.56,
        quantity: 1.obs),
    Product(
        name: "Alitas de pollo",
        image: "images/product2.webp",
        price: 323.44,
        quantity: 1.obs),
    Product(
        name: "SALCHICHAS DE ATÚN",
        image: "images/product3.webp",
        price: 183.5,
        quantity: 1.obs),
    Product(
        name: "Patas de King Crab de Alaska",
        image: "images/product4.webp",
        price: 334.66,
        quantity: 1.obs),
  ].obs;

  void addProduct(Product product) {
    Product one = Product(
        image: product.image,
        name: product.name,
        price: product.price,
        quantity: product.quantity);
    products.value.add(one);
    calculateTotalPrice();
  }

  RxDouble calculateTotalPrice() {
    var total = 0.00;
    for (int i = 0; i < products.length; i++) {
      total += products[i].quantity * products[i].price;
    }
    totalPrice = total.obs;
    update();
    return totalPrice;
  }

  RxList<Product> getProducts() {
    return products;
  }

  void updateAddQuantity(int index) {
    products[index].quantity++;
    update();
    calculateTotalPrice();
  }

  void updateSubQuantity(int index) {
    products[index].quantity--;
    if (products[index].quantity == 0) {
      products.value.remove(products[index]);
      products.refresh();
    }
    update();
    calculateTotalPrice();
  }

  void removeProduct(Product product) {
    products.remove(product);
    calculateTotalPrice();
    products.refresh();
  }
}
