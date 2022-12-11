import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twodo_app/projectValues.dart';
import 'pages/homePage.dart';
import 'pages/mainPage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('database');
  runApp(const MyApp());
}

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
