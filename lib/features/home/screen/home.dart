import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khoi_nghiep/common/util/GetColors.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_bloc.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_state.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/pages/M007Group.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/pages/M008News.dart';
import 'package:khoi_nghiep/common/injector/injection_container.dart' as kiwi;

import 'M006NewFeed.dart';
import 'M009User.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 3;
  List<Widget> listWidgetInside;
  bool isFirstTime = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        body: BlocProvider<AuthBloc>(
          create: (_) => kiwi.kiwiContainer.resolve<AuthBloc>(),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              print(state);
              if (state is Authenticated) {
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
              return IndexedStack(
                index: _currentIndex,
                children: listWidgetInside,
              );
            },
          ),
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
