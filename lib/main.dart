import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/cart_page.dart';
import 'package:practice/core/store.dart';
import 'package:practice/firebase_options.dart';
import 'package:practice/home_page.dart';
import 'package:practice/login_page.dart';
import 'package:practice/registerUser.dart';

import 'package:practice/utills/routes.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(VxState(store: MyStore(), child: const MyApp()));
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
      initialRoute: "/register",
      routes: {
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.RegistrationRoute: (context) => Registeruser(),
        MyRoutes.CartPageRoute: (context) => CartPage(),
      },
    );
  }
}
