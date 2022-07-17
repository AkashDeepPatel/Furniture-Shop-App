import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop/components/rounded_button.dart';
import 'package:furniture_shop/components/title_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/cart_controller.dart';
import 'order_successfull.dart';

CartController _cartController = Get.put(CartController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Subtotal: ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "\$${_cartController.getSubtotalAmount()}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  for (int index = 0;
                      index < _cartController.cartItemList.length;
                      index++)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(
                              _cartController.cartItemList[index].image,
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  _cartController.cartItemList[index].title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${_cartController.cartItemList[index].price}",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            // IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                            // Card(
                            //   child: Text("1"),
                            // ),
                            // IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            IconButton(
                                onPressed: () {
                                  _cartController.removeItemfromCart(index);
                                  print(_cartController.cartItemList.length);
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  RoundedButton("Procceed to Checkout", Colors.black, () async {
                    try {
                      await launch('https://rzp.io/l/LaL7rnq');
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                backgroundColor:
                                    const Color.fromRGBO(34, 48, 60, 0.6),
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                title: Center(
                                  child: Text(
                                    'Unknown Error Occured',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18.0),
                                  ),
                                ),
                                content: Center(
                                  child: Text(
                                    'Make Sure your Internet Connected Properly',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 18.0),
                                  ),
                                ),
                              ));
                    }
                  }),
                ],
              ),
            ),
          )),
    );
  }
}
