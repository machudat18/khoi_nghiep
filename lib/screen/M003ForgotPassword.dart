import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoi_nghiep/route/route.dart';
import 'package:khoi_nghiep/route/routing_contsants.dart';
import 'package:khoi_nghiep/ultils/GetColors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

//TODO Cần phải hỏi lại cách pop ở phần này
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
    var popCurrent = () {
      Navigator.of(context).pop();
    };
    return WillPopScope(
        onWillPop: () async => !await _navigatorKey.currentState.maybePop(),
        child: Navigator(
          key: _navigatorKey,
          initialRoute: ForgotPassword1,
          onGenerateRoute: (settings)=> generateRouteM003(settings,popCurrent),
        )
    );
  }
}

class StepOneContainer extends StatefulWidget {
  final VoidCallback popCurrent;

  const StepOneContainer({this.popCurrent});

  @override
  _StepOneContainerState createState() => _StepOneContainerState(popCurrent);
}

class _StepOneContainerState extends State<StepOneContainer> {
  TextEditingController _controllerPhoneNuber;
  String phoneNumber;
  final VoidCallback popCurrent;

  _StepOneContainerState(this.popCurrent);

  void initState() {
    super.initState();
    _controllerPhoneNuber = new TextEditingController();
    _controllerPhoneNuber.addListener(() {
      phoneNumber = _controllerPhoneNuber.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
            popCurrent();
          },
        ),
        title: Text(
          "Quên mật khẩu",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Center(
                      child: Text(
                    'Tài khoản',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )),
                  Container(
                    color: HexColor("#F7F7F7"),
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(left: 16),
                    child: TextField(
                      key: Key('password'),
                      controller: _controllerPhoneNuber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Số điện thoại'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {
                    Navigator.pushNamed(context, ForgotPassword2);
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: HexColor("#0062DD"),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                        child: Text(
                      'Tiếp',
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
          )),
    );
  }
}

class StepTwoContainer extends StatefulWidget {
  @override
  _StepTwoContainerState createState() => _StepTwoContainerState();
}

class _StepTwoContainerState extends State<StepTwoContainer> {
  TextEditingController _textEditingController;
  String _currentText;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController();
    _textEditingController.addListener(() {
      _currentText = _textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Quên mật khẩu",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 150),
          child: ListView(
            children: [
              Column(
                children: [
                  Center(
                      child: Text(
                    'Nhập mã xác minh',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 0,
                          height: 0,
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 24),
                          child: PinCodeTextField(
                            length: 4,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              inactiveColor: Colors.grey,
                              shape: PinCodeFieldShape.underline,
                              activeFillColor: Colors.white,
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: false,
                            controller: _textEditingController,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                _currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                            appContext: context,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 0,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Hãy để ý điện thoại và nhập tin mã OTP trong tin nhắn chúng tôi gửi bạn.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Không nhận được mã OTP? '),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Gửi lại',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {
                    //TODO Check
                    Navigator.pushNamed(context, ForgotPassword3);
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: HexColor("#0062DD"),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                        child: Text(
                      'Xác minh',
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
          )),
    );
  }
}

class StepThreeContainer extends StatefulWidget {
  final VoidCallback popCurrent;

  StepThreeContainer({this.popCurrent});

  @override
  _StepThreeContainerState createState() =>
      _StepThreeContainerState(popCurrent);
}

class _StepThreeContainerState extends State<StepThreeContainer> {
  TextEditingController _controllerPassword, _controllerRePassword;
  final VoidCallback popCurrent;

  _StepThreeContainerState(this.popCurrent);

  void initState() {
    super.initState();
    _controllerPassword = new TextEditingController();
    _controllerRePassword = new TextEditingController();
    _controllerPassword.addListener(() {});
    _controllerRePassword.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Quên mật khẩu",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 150),
          child: ListView(
            children: [
              Column(
                children: [
                  Center(
                      child: Text(
                    'Tài khoản',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )),
                  Container(
                    color: HexColor("#F7F7F7"),
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(left: 16),
                    child: TextField(
                      key: Key('password'),
                      obscureText: true,
                      controller: _controllerPassword,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Mật khẩu mới'),
                    ),
                  ),
                  Container(
                    color: HexColor("#F7F7F7"),
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(left: 16),
                    child: TextField(
                      key: Key('password'),
                      controller: _controllerRePassword,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Xác nhận mật khẩu mới'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {
                    //TODO check điều kiện
                    popCurrent();
                    Fluttertoast.showToast(
                      msg: "Đổi mật khẩu thành công",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                    );
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: HexColor("#0062DD"),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                        child: Text(
                      'Tiếp',
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
          )),
    );
  }
}
