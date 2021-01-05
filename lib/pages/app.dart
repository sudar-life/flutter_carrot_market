import 'package:flutter/material.dart';
import 'package:flutter_carrot_market/pages/favorite.dart';
import 'package:flutter_svg/svg.dart';

import 'home.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  /*
   * bottomNavigation UI 
   */
  Widget _bottomNavigationWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPageIndex,
      onTap: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      selectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        _bottomNavigationBarItem("home", "홈"),
        _bottomNavigationBarItem("notes", "동네생활"),
        _bottomNavigationBarItem("location", "내 근처"),
        _bottomNavigationBarItem("chat", "채팅"),
        _bottomNavigationBarItem("user", "나의 당근"),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String name) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/svg/${iconName}_off.svg",
        width: 22,
      ),
      activeIcon: SvgPicture.asset(
        "assets/svg/${iconName}_on.svg",
        width: 22,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          name,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  /*
   * body UI 
   */
  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
        break;
      case 1:
        return Container();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      case 4:
        return MyFavoriteContents();
        break;
    }
    return Container();
  }

  /*
   * Home 위젯 구성 
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationWidget(),
    );
  }
}
