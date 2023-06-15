import 'package:flutter/material.dart';
import 'package:flutter_login/models/Product.dart';
import 'package:flutter_login/viewmodel/cart_products.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  //const CartItem({super.key});

  final Product product;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItem(
      {super.key,
      required this.product,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    //it will keep observing the quantity of the product
    var quant = product.quantity.obs;
    Cartproducts cart = Get.find<Cartproducts>();
    return Container(
      color: Color.fromARGB(255, 232, 227, 227),
      padding: EdgeInsets.only(top: 15),
      constraints: BoxConstraints(maxHeight: 170),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Obx(
              () => Container(
                //margin: EdgeInsets.only(top: 40),
                height: 160,
                width: MediaQuery.of(context).size.width,
                //color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Image.asset(
                      product.image,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.oswald().fontFamily,
                                  fontWeight: FontWeight.w900,
                                )),
                            Text("12.35/ KG",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                )),
                            const Spacer(),
                            Text("3 pieza 0.375 KG",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                    fontStyle: FontStyle.italic)),
                            Text("\$${product.price.toString()}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.oswald().fontFamily,
                                  fontWeight: FontWeight.w900,
                                )),
                            Container(
                              //color: Colors.amber,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          onDecrement();
                                        },
                                        child: Container(
                                            alignment: const Alignment(0, 0),
                                            width: 40,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius: const BorderRadius
                                                        .only(
                                                    topLeft: Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5))),
                                            child: const Text(
                                              "-",
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      Container(
                                          alignment: const Alignment(0, 0),
                                          width: 40,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                              border: Border.symmetric(
                                                  horizontal: BorderSide(),
                                                  vertical: BorderSide.none)),
                                          child: Text(
                                            "${quant}",
                                            textAlign: TextAlign.center,
                                          )),
                                      InkWell(
                                        onTap: () {
                                          onIncrement();
                                        },
                                        child: Container(
                                            alignment: const Alignment(0, 0),
                                            width: 40,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(
                                                                5))),
                                            child: const Text(
                                              "+",
                                              textAlign: TextAlign.center,
                                            )),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      cart.removeProduct(product);
                                    },
                                    child: Image.asset(
                                      'images/account_delete_default.png',
                                      height: 32,
                                      width: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
