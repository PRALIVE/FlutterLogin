import 'package:flutter/material.dart';
import 'package:flutter_login/cart_item.dart';
import 'package:flutter_login/viewmodel/cart_products.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Cartproducts cart = Get.put(Cartproducts());

  @override
  Widget build(BuildContext context) {
    RxList products = cart.getProducts();
    cart.calculateTotalPrice();

    void incrementProduct(int index) {
      cart.updateAddQuantity(index);
    }

    void decrementProduct(int index) {
      cart.updateSubQuantity(index);
    }

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "CARRITO",
              style: TextStyle(
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                //back logic
              },
              icon: const ImageIcon(
                AssetImage('images/back_icon.png'),
                color: Colors.black,
              ),
            )),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Column(
              children: [
                Flexible(
                  child: Container(
                    //height: 300,
                    color: const Color.fromARGB(255, 232, 227, 227),
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                    child: Obx(() => ListView.builder(
                          itemCount: cart.products.value.length,
                          itemBuilder: (context, index) {
                            final product = cart.products.value[index];
                            return CartItem(
                              product: product,
                              onIncrement: () {
                                incrementProduct(index);
                              },
                              onDecrement: () {
                                decrementProduct(index);
                              },
                            );
                          },
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21, bottom: 24, left: 20),
                  child: Row(
                    children: [
                      Text(
                        "RESUMEN DEL PEDIDO",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: GoogleFonts.oswald().fontFamily,
                            fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Obx(()=>Text(
                          "( ${cart.products.length} PRODUCTOS)",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: GoogleFonts.montserrat().fontFamily),
                        ),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    height: 1,
                    color: const Color.fromARGB(255, 130, 128, 128),
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32.0, right: 32.0, top: 13, bottom: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL",
                        style: TextStyle(
                            fontFamily: GoogleFonts.oswald().fontFamily,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Obx(() => Text(
                            "\$${cart.calculateTotalPrice().value}",
                            style: TextStyle(
                                fontFamily: GoogleFonts.oswald().fontFamily,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: MaterialButton(
                      onPressed: () {},
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Text(
                        "CONTINUAR",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: GoogleFonts.oswald().fontFamily,
                        ),
                      )),
                )
              ],
            );
          },
        ));
    ;
  }
}
