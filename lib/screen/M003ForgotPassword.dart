import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoi_nghiep/ultils/GetColors.dart';
import 'package:khoi_nghiep/widget/CommonWidget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

//TODO Cần phải hỏi lại cách pop ở phần này
// Có thể sửa lại thành PageView như phần đăng ký
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var _currentPageNotifier;
  PageController _pageController;
  List<Widget> listWidgetForgotPassword;
  var textButton = 'Tiếp';

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
    return _pageController.page == listWidgetForgotPassword.length - 1;
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: "Đổi mật khẩu thành công",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
    );
  }

  @override
  void initState() {
    super.initState();
    _currentPageNotifier = ValueNotifier<int>(0);
    _pageController = PageController(initialPage: 0);
    listWidgetForgotPassword = [
      StepOneContainer(),
      StepTwoContainer(),
      StepThreeContainer(),
    ];
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
            }
           previousPage();
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
      body: ListView(
        children: [
          Container(
            height: height3 * 2 / 3,
            child: PageView.builder(
              itemCount: listWidgetForgotPassword.length,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return listWidgetForgotPassword[index];
              },
              onPageChanged: (int index) {
                if (index == 1) {
                  setState(() {
                    textButton = 'Hoàn tất';
                  });
                } else {
                  setState(() {
                    textButton = 'Tiếp';
                  });
                }
                _currentPageNotifier.value = index;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              onTap: () {
                if(isLastPage()){
                  popCurrent();
                  return;
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
        ],
      ),
    );
  }
}

class StepOneContainer extends StatefulWidget {

  const StepOneContainer();

  @override
  _StepOneContainerState createState() => _StepOneContainerState();
}

class _StepOneContainerState extends State<StepOneContainer> {
  TextEditingController _controllerPhoneNuber;
  String phoneNumber;
  void initState() {
    super.initState();
    _controllerPhoneNuber = new TextEditingController();
    _controllerPhoneNuber.addListener(() {
      phoneNumber = _controllerPhoneNuber.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24,right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleWidget('Tài khoản'),
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
    return Column(
      children: [
        TitleWidget('Nhập mã xác minh'),
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
                padding: const EdgeInsets.only(left: 8, right: 8, top: 24),
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
        Container(
          padding: const EdgeInsets.only(left: 24,right: 24),
          child: Text(
            'Hãy để ý điện thoại và nhập tin mã OTP trong tin nhắn chúng tôi gửi bạn.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
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
                    color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class StepThreeContainer extends StatefulWidget {

  StepThreeContainer();

  @override
  _StepThreeContainerState createState() => _StepThreeContainerState();
}

class _StepThreeContainerState extends State<StepThreeContainer> {
  TextEditingController _controllerPassword, _controllerRePassword;

  _StepThreeContainerState();

  void initState() {
    super.initState();
    _controllerPassword = new TextEditingController();
    _controllerRePassword = new TextEditingController();
    _controllerPassword.addListener(() {});
    _controllerRePassword.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top : 60),
      padding: const EdgeInsets.only(left : 24, right: 24),
      child: Column(
        children: [
          Column(
            children: [
              Center(
                  child: Text(
                'Điền thông tin',
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
              DescriptionWidget('Mật khẩu mới và xác nhận mật khẩu mới phải giống nhau'),
            ],
          ),
        ],
      ),
    );
  }
}
