import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/screen/M003ForgotPassword.dart';
import 'package:khoi_nghiep/screen/M004SignUp.dart';
import 'package:khoi_nghiep/ultils/GetColors.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerUserName, _controllerPassword;
  String _username, _password;

  @override
  void initState() {
    super.initState();
    _controllerUserName = TextEditingController();
    _controllerPassword = TextEditingController();
    _controllerUserName.addListener(() {
      _username = _controllerUserName.text;
    });
    _controllerPassword.addListener(() {
      _password = _controllerPassword.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("build");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Đăng nhập',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(75)),
                      color: HexColor("#EBF2FC")),
                  child: Image.asset('assets/lock.png'),
                ),
              ),
              Container(
                color: HexColor("#F7F7F7"),
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: _controllerUserName,
                  autofocus: false,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Tài khoản'),
                ),
              ),
              Container(
                color: HexColor("#F7F7F7"),
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  obscureText: true,
                  autofocus: false,
                  key: Key('password'),
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Mật khẩu'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {},
                  child: Ink(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: HexColor("#0062DD"),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                        child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    )),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    thickness: 3,
                    color: HexColor("#DEDEDE"),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hoặc",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: HexColor("#DEDEDE"),
                    thickness: 3,
                  )),
                ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            onTap: () {},
                            child: Ink(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: HexColor("#4267B2"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Facebook',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: new Image.asset(
                                      'assets/facebook_icon.png',
                                      color: HexColor("#4267B2"),
                                      width: 24,
                                      height: 24,
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            onTap: () {},
                            child: Ink(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: HexColor("##D54C3F"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: new Image.asset(
                                      'assets/google_icon.png',
                                      color: Colors.white,
                                      width: 24,
                                      height: 24,
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()),
                            );
                          },
                          child: Text(
                            'Quên mật khẩu?',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: HexColor('0062DD'),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Bạn chưa có tài khoản? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('0062DD'),
                                      decoration: TextDecoration.underline),
                                ),
                                TextSpan(
                                  text: 'Đăng ký ngay',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: HexColor('0062DD'),
                                      decoration: TextDecoration.underline),
                                )
                              ]),
                            )),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
