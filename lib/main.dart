import 'package:flutter/material.dart';
import 'package:monos/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:monos/src/presentation/pages/auth/register/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: 'login',
      routes:{
        'login':(context) => LoginPage(),
        'register':(context) => RegisterPage(),
      },
    );
  }
}
