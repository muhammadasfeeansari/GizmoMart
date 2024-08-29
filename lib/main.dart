import 'package:flutter/material.dart';
import 'package:practice/cart_page.dart';
import 'package:practice/home_page.dart';
import 'package:practice/login_page.dart';

import 'package:practice/utills/routes.dart';
import 'package:practice/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: mytheme.lightTheme(context),
      darkTheme: mytheme.darktheme(context),
      debugShowCheckedModeBanner: false,
      title: 'learning flutter',
      initialRoute: "/login",
      routes: {
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.CartPageRoute: (context) => CartPage(),
      },
    );
  }
}
