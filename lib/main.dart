import 'package:ecommerce/constants.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      //home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
