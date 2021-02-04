import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/model/UserData.dart';

class UserLogged extends StatefulWidget {
  @override
  _UserLoggedState createState() => _UserLoggedState();
}

class _UserLoggedState extends State<UserLogged> {
  UserData data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDummyData();
  }

  void initDummyData() {
    data = new UserData(
        'assets/avatar.jpg',
        'assets/back_ground.jpg',
        "Trần Đạt",
        'dat2030',
        '0344822735',
        'trandat728@gmail.com',
        new List());
    data.following = [data, data, data, data];
  }

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top.toDouble();
    const bottomNavigationBarHeight = kBottomNavigationBarHeight;
    print('pageuser');
    return Stack(
      children: [
        Container(
          height: 370,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back_ground.jpg'), fit: BoxFit.cover),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: paddingTop),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      '${data.name}',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              height: 100,
              color: Colors.brown,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: ClipOval(
                      child: new Image.asset(
                        'assets/avatar.jpg',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
