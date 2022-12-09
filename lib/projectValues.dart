import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectValue {
  final Color mainThemeColor = const Color.fromRGBO(255, 117, 159, 1);
  final Color contaThemeColor = const Color.fromRGBO(255, 255, 255, 1);
  final Color headThemeColor = const Color.fromRGBO(111, 0, 178, 1);
  final Color descThemeColor = const Color.fromRGBO(111, 0, 178, 0.7);
  final Color bgThemeColor = const Color.fromRGBO(245, 228, 252, 1);
  final Color bottomIcoColor = const Color.fromRGBO(255, 255, 255, 1);
  final Color gradientColor1 = const Color.fromRGBO(214, 225, 255, 1);
  final Color gradientColor2 = const Color.fromRGBO(214, 225, 255, 0);
  final Color cardColor = const Color.fromRGBO(246, 244, 252, 1); //rgba(246, 244, 252, 1)
  final double elevation = 0;
}

class HomePageValue {
  BorderRadiusGeometry radius = const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50));
  BorderRadiusGeometry bottomNavRadius =
      const BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0));
  BorderRadiusGeometry buttonRadius = const BorderRadius.all(Radius.circular(50));
  BorderRadiusGeometry detailRadius = const BorderRadius.all(Radius.circular(20));

  Text homePageText = Text('Organize Your\n Daily Task',
      textAlign: TextAlign.center,
      style: TextStyle(color: ProjectValue().headThemeColor, fontSize: 35, fontFamily: 'Poppins Bold'));

  Text homePageDesc = Text(
    'All the task management feature\norganize in our app and more.',
    textAlign: TextAlign.center,
    style: TextStyle(
        color: ProjectValue().descThemeColor, fontSize: 14, fontWeight: FontWeight.w800, fontFamily: 'Poppins'),
  );
}

// Device Size Value

double getDeviceWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

double getDeviceHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}
