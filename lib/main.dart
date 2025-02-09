import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/Routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey.shade300), // Default border color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300), // On focus
              ),
            )),
        title: 'Grocery Shopping',
        initialRoute: '/',
        routes: routesName);
  }
}
