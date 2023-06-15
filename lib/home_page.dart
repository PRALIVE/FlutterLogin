import 'package:flutter/material.dart';
import 'package:flutter_login/cart_item.dart';
import 'package:flutter_login/cart_screen.dart';
import 'package:flutter_login/image_pick_screen.dart';
import 'package:flutter_login/lock_screen.dart';
import 'package:flutter_login/login_page.dart';
import 'package:flutter_login/movies_screen.dart';
import 'package:flutter_login/service/firebase_notification_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  FirebaseNotificationService service = FirebaseNotificationService();
  int selected_tab = 0;
  List pages = [LoginPage(), CartScreen(), MyMovies(), LockScreen()];

  change_Tab(int index) {
    setState(() {
      selected_tab = index;
    });
  }

  @override
  void initState() {
    super.initState();
    service.requestNotificationPermission();
    service.firebastInit();
    service.getDeviceToken().then((value) => print("device token $value"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selected_tab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selected_tab,
          onTap: (index) => change_Tab(index),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/menu_home.png')),
                label: "Tienda"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/menu_cart_default.png')),
                label: "Reordenar"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/menu_account_default.png')),
                label: "Cuenta"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/menu_more_default.png')),
                label: "Más")
          ]),
    );
  }
}
