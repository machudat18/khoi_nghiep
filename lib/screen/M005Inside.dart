import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/screen/M007Group.dart';
import 'package:khoi_nghiep/screen/M008News.dart';
import 'package:khoi_nghiep/service/auth.dart';
import 'package:khoi_nghiep/ultils/GetColors.dart';

import 'M006NewFeed.dart';
import 'M009User.dart';

class InsideManagement extends StatefulWidget {
  @override
  _InsideManagementState createState() => _InsideManagementState();
}

class _InsideManagementState extends State<InsideManagement> {
  var _currentIndex = 3;
  List<Widget> listWidgetInside;
  bool isFirstTime = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthService().getStreamUser().listen((user) {
      if (user != null) {
        listWidgetInside = [
          NewFeed(),
          Group(),
          News(),
          UserLogged(),
        ];
      } else {
        listWidgetInside = [
          NewFeed(),
          Group(),
          News(),
          UserUnLogged(),
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: listWidgetInside,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: HexColor('#FF6000'),
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                label: 'newsfeed',
                icon: ImageIcon(AssetImage('assets/newsfeed.png')),
              ),
              BottomNavigationBarItem(
                label: 'group',
                icon: ImageIcon(AssetImage('assets/group.png')),
              ),
              BottomNavigationBarItem(
                label: 'notification',
                icon: ImageIcon(AssetImage('assets/news.png')),
              ),
              BottomNavigationBarItem(
                label: 'user',
                icon: ImageIcon(AssetImage('assets/user.png')),
              ),
            ],
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            }));
  }
}
