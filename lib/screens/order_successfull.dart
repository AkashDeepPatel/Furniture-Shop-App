import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop/components/rounded_button.dart';
import 'package:furniture_shop/components/title_text.dart';
import 'package:furniture_shop/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/cart_controller.dart';

CartController _cartController = Get.put(CartController());

class OrderSuccessfull extends StatelessWidget {
  const OrderSuccessfull({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 100,
          ),
          Text("Your Order has been Successfully Placed."),
          RoundedButton("OK", Colors.black, () {
            Get.to(HomeScreen());
          }),
        ],
      ),
    ));
  }
}
