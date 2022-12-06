import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twodo_app/projectValues.dart';
import 'pages/homePage.dart';
import 'pages/mainPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Poppins',
        appBarTheme:
            AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: ProjectValue().mainThemeColor)),
      ),
      routes: {
        '/': (context) => const HomePage(),
        'mainPage': (context) => const MainPage(),
      },
    );
  }
}
