// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../projectValues.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getDeviceWidth(context);
    getDeviceHeight(context);
    return Scaffold(
      backgroundColor: ProjectValue().bgThemeColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: getDeviceHeight(context) / 17,
              ),
              Lottie.asset('lib/assets/homepage.json'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: getDeviceWidth(context),
                height: getDeviceHeight(context) / 1.9,
                decoration: BoxDecoration(
                  color: ProjectValue().contaThemeColor,
                  borderRadius: HomePageValue().radius,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: getDeviceHeight(context) / 20),
                        child: HomePageValue().homePageText,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getDeviceHeight(context) / 30),
                        child: HomePageValue().homePageDesc,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getDeviceHeight(context) / 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'mainPage');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ProjectValue().mainThemeColor,
                              borderRadius: HomePageValue().buttonRadius,
                            ),
                            height: getDeviceHeight(context) / 10,
                            width: getDeviceHeight(context) / 10,
                            child: Center(
                              child: Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.white, size: getDeviceHeight(context) / 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
