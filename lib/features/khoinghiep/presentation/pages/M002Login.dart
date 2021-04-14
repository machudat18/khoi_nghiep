import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/core/util/GetColors.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/usecases/login_usecase.dart';
import 'package:khoi_nghiep/route/routing_contsants.dart' as Routes;

import '../../../../injection_container.dart';

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
    return WillPopScope(
      onWillPop: () async {
        _moveToInSideScreen(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
            onPressed: () {
              _moveToInSideScreen(context);
            },
          ),
          title: Text(
            'Đăng nhập',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  onTap: () async {
                    if (_username == null || _password == null) {
                      return;
                    }
                    kiwiContainer
                        .resolve<LogInUseCase>()
                        .call(LoginParam(_username, _password));
                    //BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: _username, password: _password));
                    // if (result == null) {
                    //   print('Đăng nhập thất bại');
                    // } else {
                    //   Navigator.pushReplacementNamed(
                    //       context, Routes.InsideRouteManagement);
                    // }
                  },
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
                    thickness: 1,
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
                    thickness: 1,
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
                                      width: 16,
                                      height: 16,
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
                            onTap: () async {},
                            child: Ink(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: HexColor("#D54C3F"),
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
                                      width: 16,
                                      height: 16,
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
                    height: 70,
                  ),
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.ForgotPasswordRoute);
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
                              Navigator.of(context)
                                  .pushNamed(Routes.SignUpRoute);
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

  void _moveToInSideScreen(BuildContext context) =>
      Navigator.pushReplacementNamed(context, Routes.InsideRouteManagement);
}
