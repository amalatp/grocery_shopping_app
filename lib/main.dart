import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/configs/Routes/routes_name.dart';
import 'package:grocery_shopping_app/features/authentication/data/data_provider/auth_data_provider.dart';

import 'features/authentication/bloc/auth_bloc.dart';
import 'features/authentication/data/repositoty/auth_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthRepository(AuthDataProvider())),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              )),
          title: 'Grocery Shopping',
          initialRoute: '/',
          routes: routesName),
    );
  }
}
