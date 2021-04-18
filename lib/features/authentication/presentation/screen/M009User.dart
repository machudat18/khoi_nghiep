import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khoi_nghiep/common/util/GetColors.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_bloc.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_event.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/widgets/CommonWidget.dart';
import 'package:khoi_nghiep/route/routing_contsants.dart';

class UserLogged extends StatefulWidget {
  @override
  _UserLoggedState createState() => _UserLoggedState();
}

class _UserLoggedState extends State<UserLogged> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void initDummyData() {}

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top.toDouble();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const ELEVATION = 2.0;

    return StreamBuilder<DocumentSnapshot>(
      //stream: StorageService().userData,
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.none) {
          print(snapshot.data?.data());
          // final Map data = snapshot.data?.data();
          // String followingCount = data['following'] == null
          //     ? '0'
          //     : data['following'].length.toString();
          final Map data = {
            'name': 'dat',
          };
          String followingCount = '0';
          return Stack(
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 375,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage('assets/back_ground.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      height: height + kBottomNavigationBarHeight + 100,
                      margin: const EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                        color: const Color(0x000000).withOpacity(0),
                      ),
                      child: Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                            color: HexColor('#F7F7F7'),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Material(
                                elevation: ELEVATION,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${data['name']}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      SizedBox(height: 16),
                                      Table(
                                        children: [
                                          TableRow(
                                            children: [
                                              TextNormal(followingCount, 16),
                                              TextNormal(followingCount, 16),
                                              TextNormal(followingCount, 16)
                                            ],
                                          ),
                                          TableRow(children: [
                                            TextNormal('Người theo dõi', 12),
                                            TextNormal('Đang theo dõi', 12),
                                            TextNormal('Bài viết', 12)
                                          ])
                                        ],
                                      ),
                                      Container(
                                        width: width * 2 / 3,
                                        margin: const EdgeInsets.only(
                                            top: 36, bottom: 16),
                                        child: InkWell(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          onTap: () {},
                                          child: Ink(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: HexColor("#0062DD"),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Hồ sơ cá nhân',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat'),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Material(
                                elevation: ELEVATION,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                child: UserButton(
                                  text: 'Dòng thời gian',
                                  action: () {
                                    print('click');
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Material(
                                shape: RoundedRectangleBorder(
                                    //side: BorderSide(width: 0.1),
                                    borderRadius: BorderRadius.circular(5.0)),
                                elevation: ELEVATION,
                                child: Column(
                                  children: [
                                    UserButton(
                                      text: 'Bài viết',
                                      count: followingCount,
                                      action: () {},
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 20),
                                      child: Divider(
                                        thickness: 2,
                                        color: HexColor("#DEDEDE"),
                                      ),
                                    ),
                                    UserButton(
                                      text: 'Đang theo dõi',
                                      count: followingCount,
                                      action: () {},
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 20),
                                      child: Divider(
                                        thickness: 2,
                                        color: HexColor("#DEDEDE"),
                                      ),
                                    ),
                                    UserButton(
                                      text: 'Đã lưu',
                                      count: followingCount,
                                      action: () {},
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Material(
                                elevation: ELEVATION,
                                shape: RoundedRectangleBorder(
                                    //side: BorderSide(width: 0.1),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: UserButton(
                                  text: 'Cài đặt',
                                  action: () {
                                    print('click');
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Material(
                                  elevation: ELEVATION,
                                  shape: RoundedRectangleBorder(
                                      //side: BorderSide(width: 0.1),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: TextNormal('Chuyển tài khoản', 14),
                                    ),
                                  )),
                              SizedBox(
                                height: 16,
                              ),
                              Material(
                                  elevation: ELEVATION,
                                  shape: RoundedRectangleBorder(
                                      //side: BorderSide(width: 0.1),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: InkWell(
                                    onTap: () {
                                      //TODO đăng xuất
                                      BlocProvider.of<AuthBloc>(context)
                                          .add(SignOut());
                                      //await AuthService().logOut();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: TextNormal('Đăng xuất', 14),
                                    ),
                                  )),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: new Image.asset(
                                        'assets/avatar.jpg',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.camera_alt_sharp,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
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
            ],
          );
        }
        return Center(child: Text("Loading"));
      },
    );
  }
}

class UserButton extends StatelessWidget {
  final VoidCallback action;
  final text;
  final count;

  const UserButton({Key key, this.action, this.text, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextNormal('$text', 14),
            Row(
              children: [
                checkCount(count),
                Icon(
                  Icons.navigate_next,
                  color: HexColor('7A7A7A'),
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  checkCount(count) {
    if (count != null) {
      return Text('$count', style: TextStyle(color: HexColor('#57A1FF')));
    } else {
      return Container(width: 0, height: 0);
    }
  }
}

class UserUnLogged extends StatefulWidget {
  @override
  _UserUnLoggedState createState() => _UserUnLoggedState();
}

class _UserUnLoggedState extends State<UserUnLogged> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const ELEVATION = 1.0;

    return Stack(
      children: [
        Container(
          height: 375,
          color: HexColor('#BBEDE4'),
        ),
        Container(
          height: height + kBottomNavigationBarHeight,
          margin: const EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
            color: const Color(0x000000).withOpacity(0),
          ),
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: HexColor('#F7F7F7'),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Material(
                    elevation: ELEVATION,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Người dùng',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          SizedBox(height: 16),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  TextNormal('0', 16),
                                  TextNormal('0', 16),
                                  TextNormal('0', 16)
                                ],
                              ),
                              TableRow(children: [
                                TextNormal('Người theo dõi', 12),
                                TextNormal('Đang theo dõi', 12),
                                TextNormal('Bài viết', 12)
                              ])
                            ],
                          ),
                          Container(
                            width: width * 2 / 3,
                            margin: const EdgeInsets.only(top: 36, bottom: 16),
                            child: InkWell(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              onTap: () {
                                // Navigator.of(context)
                                //     .pushReplacementNamed(LoginRoute);
                                BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: '22@gmail.com', password: '123456'));
                              },
                              child: Ink(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: HexColor("#0062DD"),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Center(
                                    child: Text(
                                  'Đăng nhập / Đăng ký',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat'),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Material(
                    elevation: ELEVATION,
                    shape: RoundedRectangleBorder(
                        //side: BorderSide(width: 0.1),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: UserButton(
                      text: 'Cài đặt',
                      action: () {
                        print('click');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Container(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100.0,
                        backgroundImage: AssetImage('assets/default_ava.jpg'),
                        backgroundColor: Colors.white,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt_sharp,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
