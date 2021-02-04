import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/screen/M007Group.dart';
import 'package:khoi_nghiep/screen/M008News.dart';
import 'package:khoi_nghiep/ultils/GetColors.dart';

import 'M006NewFeed.dart';
import 'M009User.dart';

class InsideManagement extends StatefulWidget {
  @override
  _InsideManagementState createState() => _InsideManagementState();
}

class _InsideManagementState extends State<InsideManagement> {
  static final int HIDE = 0;
  static final int SHOW = 100;
  var _currentIndex = 0;
  var _currentPageNotifier;
  PageController _pageController;
  List<Widget> listWidgetInside;
  var textButton = 'Tiếp';
  var alpha = HIDE;
  void animateToPage(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  bool isFirstPage() {
    return _pageController.page == 0;
  }

  bool isLastPage() {
    return _pageController.page == listWidgetInside.length - 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPageNotifier = ValueNotifier<int>(0);
    _pageController = PageController(initialPage: 0);
    listWidgetInside = [
      NewFeed(),
      Group(),
      News(),
      UserLogged(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          itemCount: listWidgetInside.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return listWidgetInside[index];
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
            setState(() {
              _currentIndex = index;
            });
          },
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
              animateToPage(value);
              setState(() {
                _currentIndex = value;
              });
            }));
  }
}
