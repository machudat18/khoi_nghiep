import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:khoi_nghiep/model/UserInformation.dart';
import 'package:khoi_nghiep/ultils/GetColors.dart';
import 'package:khoi_nghiep/widget/SignUpWidget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _currentPageNotifier;
  PageController _pageController;
  List<Widget> listWidgetSignUp;
  DataSignUp _userInformation = new DataSignUp("", "", "", "", "", "");
  var textButton = 'Tiếp';

  @override
  void initState() {
    super.initState();
    _currentPageNotifier = ValueNotifier<int>(0);
    _pageController = PageController(initialPage: 0);

    listWidgetSignUp = [
      Welcome(),
      Name(_userInformation),
      PhoneNumber(_userInformation),
      Email(_userInformation),
      Account(_userInformation),
      End(),
    ];
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }
  bool isFirstPage() {
    return _pageController.page == 0;
  }
  bool isLastPage() {
    return _pageController.page == listWidgetSignUp.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    var padding = MediaQuery.of(context).padding;
    // Height (without status and toolbar)
    double height3 = height - padding.top - kToolbarHeight;
    var popCurrent = () {
      Navigator.of(context).pop();
    };
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
            if(isFirstPage()){
              popCurrent();
              return;
            } else {
              previousPage();
            }
          },
        ),
        title: Text(
          "Đăng ký tài khoản",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: ListView(
          children: [
            Container(
              height: height3 * 2 / 3,
              child: PageView.builder(
                itemCount: listWidgetSignUp.length,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  return listWidgetSignUp[index];
                },
                onPageChanged: (int index) {
                  if (index >= listWidgetSignUp.length - 1) {
                    setState(() {
                      textButton = 'Hoàn tất';
                    });
                  } else {
                    setState(() {
                      textButton = 'Tiếp';
                    });
                  }
                  log(_userInformation.toString());
                  _currentPageNotifier.value = index;
                },
              ),
            ),
            Container(
              height: height3 / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      onTap: () {
                        if (isLastPage()) {
                         popCurrent();
                        }
                        nextPage();
                      },
                      child: Ink(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: HexColor("#0062DD"),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                            child: Text(
                          '$textButton',
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
                    margin: const EdgeInsets.all(50),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Bạn đã có tài khoản? ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('0062DD'),
                                  decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: 'Đăng nhập ngay',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HexColor('0062DD'),
                                  decoration: TextDecoration.underline),
                            )
                          ]),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget('Tham gia khởi nghiệp'),
        SizedBox(
          height: 10,
        ),
        DescriptionWidget(
            'Chúng tôi sẽ giúp bạn tạo tài khoản sau vài bước dễ dàng'),
      ],
    );
  }
}

class Name extends StatelessWidget {
  final DataSignUp _userInformation;

  Name(this._userInformation);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    _controller.addListener(() {
      _userInformation.name = _controller.text;
    });
    return Column(
      children: [
        TitleWidget('Bạn tên gì'),
        TextInputWidget(
          controller: _controller,
          hint: 'Họ và tên',
        ),
        DescriptionWidget('Dùng tên thật giúp bạn bè dễ dàng nhận ra bạn hơn.'),
      ],
    );
  }
}

class PhoneNumber extends StatelessWidget {
  final DataSignUp _userInformation;

  PhoneNumber(this._userInformation);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    _controller.addListener(() {
      _userInformation.phoneNumber = _controller.text;
    });
    return Column(
      children: [
        TitleWidget('Số điện thoại'),
        TextInputWidget(
          hint: 'Số điện thoại',
          controller: _controller,
        ),
        DescriptionWidget('Bạn sẽ dùng số này khi cần đặt lại mật khẩu'),
      ],
    );
  }
}

class Email extends StatelessWidget {
  final DataSignUp _userInformation;

  Email(this._userInformation);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    _controller.addListener(() {
      _userInformation.email = _controller.text;
    });
    return Column(
      children: [
        TitleWidget('Email'),
        TextInputWidget(
          controller: _controller,
          hint: 'Email',
        ),
        DescriptionWidget(
            'Bạn sẽ dùng email này khi cần đặt lại mật khẩu và nhận các thông báo'),
      ],
    );
  }
}

class Account extends StatelessWidget {
  final DataSignUp _userInformation;

  Account(this._userInformation);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerUsername = new TextEditingController();
    TextEditingController _controllerPassword = new TextEditingController();
    TextEditingController _controllerRePassword = new TextEditingController();
    _controllerUsername.addListener(() {
      _userInformation.userName = _controllerUsername.text;
    });
    _controllerPassword.addListener(() {
      _userInformation.password = _controllerPassword.text;
    });
    _controllerRePassword.addListener(() {
      _userInformation.rePassword = _controllerRePassword.text;
    });
    return Column(
      children: [
        TitleWidget('Email'),
        TextInputWidget(
          controller: _controllerUsername,
          hint: 'Tài khoản',
        ),
        TextInputWidget(
          controller: _controllerPassword,
          hint: 'Mật khẩu',
        ),
        TextInputWidget(
          controller: _controllerRePassword,
          hint: 'Xác nhận mật khẩu',
        ),
        DescriptionWidget(
            'Những thông tin này dùng để đăng nhập vào hệ thống.'),
      ],
    );
  }
}

class End extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget('Hoàn tất đăng ký'),
        SizedBox(
          height: 10,
        ),
        DescriptionWidget(
            'Bằng cách nhấn vào Đăngký, bạn đồng ý với Điều khoản, Chính sách dữ liệu và chính sách Cookie của chúng tôi'
            '. Bạn có thể nhận được thông báo của chúng tôi qua SMS và chọn không nhận bất cứ lức nào.'),
      ],
    );
  }
}
