import 'package:flutter/material.dart';
import 'package:twodo_app/projectValues.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    getDeviceWidth(context);
    getDeviceHeight(context);
    int currentIndex = 0;
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      body: Stack(
        children: [
          Container(
            height: getDeviceHeight(context) / 8,
            color: Colors.red,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: getDeviceWidth(context) / 20),
                  child: showNowDate(),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(currentIndex, context),
    );
  }

  Widget bottomNavigationBar(int currentIndex, BuildContext context) {
    return ClipRRect(
      borderRadius: HomePageValue().bottomNavRadius,
      child: BottomAppBar(
        elevation: ProjectValue().elevation,
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ProjectValue().mainThemeColor,
          elevation: ProjectValue().elevation,
          showSelectedLabels: false,
          onTap: (value) {
            setState(() {
              var currentIndex = value;
              if (currentIndex == 0) {
              } else if (currentIndex == 1) {
              } else if (currentIndex == 2) {
              } else if (currentIndex == 3) {}
            });
          },
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          selectedItemColor: ProjectValue().bottomIcoColor,
          unselectedItemColor: ProjectValue().bottomIcoColor,
          iconSize: getDeviceHeight(context) / 27,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_outlined), label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton.extended(
      backgroundColor: ProjectValue().mainThemeColor,
      elevation: 0,
      tooltip: 'New Task',
      onPressed: () {},
      label: const Text('New Task'),
      icon: const Icon(Icons.add),
    );
  }

  Text showNowDate() {
    late String monthStr;
    DateTime now = DateTime.now();
    if (now.month == 1) {
      monthStr = 'Jan';
    } else if (now.month == 2) {
      monthStr = 'Feb';
    } else if (now.month == 3) {
      monthStr = 'Mar';
    } else if (now.month == 4) {
      monthStr = 'Apr';
    } else if (now.month == 5) {
      monthStr = 'May';
    } else if (now.month == 6) {
      monthStr = 'Jun';
    } else if (now.month == 7) {
      monthStr = 'Jul';
    } else if (now.month == 8) {
      monthStr = 'Aug';
    } else if (now.month == 9) {
      monthStr = 'Sep';
    } else if (now.month == 10) {
      monthStr = 'Oct';
    } else if (now.month == 11) {
      monthStr = 'Nov';
    } else if (now.month == 12) {
      monthStr = 'Dec';
    }

    if (now.day < 10) {
      return Text(
        '0${now.day} $monthStr ${now.year}',
        style: TextStyle(
            color: ProjectValue().bottomIcoColor, fontFamily: 'Poppins Bold', fontSize: getDeviceWidth(context) / 22),
      );
    }
    return Text(
      '${now.day} $monthStr ${now.year}',
      style: TextStyle(color: ProjectValue().bottomIcoColor),
    );
  }
}
