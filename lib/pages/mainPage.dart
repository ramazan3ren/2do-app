import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
    var box = Hive.box('database');

    return Scaffold(
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Column(
            children: [
              appBar(context),
              appBarCard(context),
              Container(
                height: getDeviceHeight(context) / 100,
              ),
              const toDayTask(),
              Container(
                height: getDeviceHeight(context) / 140,
              ),
              listView(context),
            ],
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(currentIndex, context),
    );
  }

  Expanded listView(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(Size.infinite),
        child: SizedBox(
          height: getDeviceHeight(context) / 2.2,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 0,
              left: getDeviceWidth(context) / 15,
              right: getDeviceWidth(context) / 15,
            ),
            scrollDirection: Axis.vertical,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: getDeviceHeight(context) / 35),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  color: ProjectValue().cardColor,
                  child: ListTile(
                    style: ListTileStyle.list,
                    onTap: () {},
                    title: Text(
                      'IconDesign',
                      style: TextStyle(color: ProjectValue().headThemeColor, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '08:00 AM - 10:00 AM',
                      style: TextStyle(fontSize: getDeviceHeight(context) / 60, color: ProjectValue().headThemeColor),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Column appBarCard(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: getDeviceHeight(context) / 40),
          child: SizedBox(
            // color: Colors.red,
            width: getDeviceWidth(context),
            height: getDeviceHeight(context) / 4,
            child: Center(
              child: Container(
                height: getDeviceHeight(context) / 4.2,
                width: getDeviceWidth(context) / 1.2,
                decoration: BoxDecoration(
                    borderRadius: HomePageValue().detailRadius,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      // end: Alignment.bottomRight,
                      colors: [
                        ProjectValue().gradientColor1,
                        ProjectValue().gradientColor2,
                      ],
                    )),
                child: Row(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: getDeviceWidth(context) / 20, bottom: getDeviceHeight(context) / 50),
                        child: Text(
                          'Your daily plan\nalmost done.\nFighting!',
                          style: TextStyle(
                              color: ProjectValue().headThemeColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context).textTheme.headline6!.fontSize),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getDeviceWidth(context) / 100,
                        ),
                        child: Text(
                          '4 of 6 completed',
                          style: TextStyle(
                            color: ProjectValue().headThemeColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox appBar(BuildContext context) {
    return SizedBox(
      height: getDeviceHeight(context) / 7,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: getDeviceWidth(context) / 12),
                child: showNowDate(),
              ),
              Padding(
                padding: EdgeInsets.only(left: getDeviceWidth(context) / 12),
                child: Text(
                  '4 Task Today',
                  style: TextStyle(
                    color: ProjectValue().headThemeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: getDeviceHeight(context) / 15, left: getDeviceWidth(context) / 2.3),
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                'https://xsgames.co/randomusers/avatar.php?g=male',
              ),
              backgroundColor: ProjectValue().mainThemeColor,
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNavigationBar(int currentIndex, BuildContext context) {
    return ClipRRect(
      borderRadius: HomePageValue().bottomNavRadius,
      child: BottomAppBar(
        elevation: ProjectValue().elevation,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ProjectValue().mainThemeColor,
          elevation: ProjectValue().elevation,
          showSelectedLabels: false,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          selectedItemColor: ProjectValue().bottomIcoColor,
          unselectedItemColor: ProjectValue().bottomIcoColor,
          iconSize: getDeviceHeight(context) / 27,
          items: bottomNavItem,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get bottomNavItem {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_outlined), label: 'Tasks'),
    ];
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: ProjectValue().mainThemeColor,
      elevation: 0,
      tooltip: 'New Task',
      onPressed: () {},
      child: const Icon(Icons.add),
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
          color: ProjectValue().headThemeColor,
          fontFamily: 'Poppins Bold',
          fontSize: getDeviceWidth(context) / 22,
        ),
      );
    }
    return Text(
      '${now.day} $monthStr ${now.year}',
      style: TextStyle(
        color: ProjectValue().headThemeColor,
        fontFamily: 'Poppins Bold',
        fontSize: getDeviceWidth(context) / 22,
      ),
    );
  }

// hive methods

// add method

  void addTask(Box data) {
    data.add(data);
  }
}

class toDayTask extends StatelessWidget {
  const toDayTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: getDeviceWidth(context) / 15),
          child: SizedBox(
            child: Text(
              'Today’s Task',
              style: TextStyle(
                color: ProjectValue().headThemeColor,
                fontFamily: 'Poppins Bold',
                fontSize: getDeviceWidth(context) / 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
