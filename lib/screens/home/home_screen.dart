import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop/screens/home/components/body.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../size_config.dart';
import '../cart_screen.dart';
import '../welcome_screen.dart';

// CartController _cartController = Get.put(CartController());

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final _auth = FirebaseAuth.instance;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    List name = [];
    name.add((_auth.currentUser.email).split("@"));
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        onPressed: () {
          _auth.signOut();
          Get.off(WelcomeScreen());
        },
      ),
      title: Text(
        "Welcome, ${name[0][0].toString().capitalize}",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/bag.svg"),
          onPressed: () {
            Get.to(CartScreen());
          },
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
