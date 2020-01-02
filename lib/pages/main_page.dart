import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter/pages/home_page.dart';
import 'package:github_flutter/res/colors.dart';
import 'package:github_flutter/res/strings.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  BottomNavigationBarItem _createHomeTab(IconData iconData, String title) {
    return BottomNavigationBarItem(
        icon: Icon(iconData, color: ColorsR.font3),
        activeIcon: Icon(iconData, color: ColorsR.colorPrimary),
        title: Text(title));
  }

  int _currIndex;
  PageController _pageController;
  Widget _homePage;

  @override
  void initState() {
    super.initState();
    _currIndex = 0;
    _pageController = PageController(initialPage: _currIndex);
    _homePage = HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsR.appTitle,
            style: TextStyle(color: Colors.white),
          ),
          brightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currIndex,
          onTap: (index) {
            setState(() {
              _currIndex = index;
            });
            _pageController.jumpToPage(index);
          },
          items: [
            _createHomeTab(Icons.home, StringsR.tabHome),
            _createHomeTab(Icons.explore, StringsR.tabDiscover),
            _createHomeTab(Icons.person, StringsR.tabMine)
          ],
          backgroundColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 24,
        ),
        body: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _homePage;
            }
            return Center(child: Text('第 $index 页'));
          },
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
