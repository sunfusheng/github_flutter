import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter/res/colors.dart';
import 'package:github_flutter/res/strings.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currIndex = 0;

  BottomNavigationBarItem createHomeTab(IconData iconData, String title) {
    return BottomNavigationBarItem(
        icon: Icon(iconData, color: ColorsR.font3),
        activeIcon: Icon(iconData, color: ColorsR.colorPrimary),
        title: Text(title));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsR.appTitle,
          style: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index) {
          setState(() {
            currIndex = index;
          });
        },
        items: [
          createHomeTab(Icons.home, '主页'),
          createHomeTab(Icons.explore, '发现'),
          createHomeTab(Icons.person, '我的')
        ],
        backgroundColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 24,
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Center(child: Text('第 $currIndex 页'));
        },
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
