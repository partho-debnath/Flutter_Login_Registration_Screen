import 'package:flutter/material.dart';

import './screens/login_sereen.dart';
import './screens/registration_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.purple,
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Colors.lightGreen,
          suffixIconColor: Colors.lightGreen,
          labelStyle: const TextStyle(color: Colors.blueGrey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      title: 'Login Registration',
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (cntxt) => const LoginScreen(),
        RegistrationScreen.routeName: (cntxt) => const RegistrationScreen(),
      },
    );
  }
}
