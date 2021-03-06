
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/common/util/GetColors.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;

  final String hint;

  TextInputWidget({this.controller,this.hint});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: HexColor("#F7F7F7"),
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.only(left: 16),
      child: TextField(
        autofocus: false,
        controller: controller,
        decoration:
        InputDecoration(border: InputBorder.none, hintText: '$hint'),
      ),
    );
  }
}


class DescriptionWidget extends StatelessWidget {
  final String text;

  DescriptionWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
    );
  }
}


class TitleWidget extends StatelessWidget {
  final String _title;
  TitleWidget(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          '$_title',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }
}

class TextNormal extends StatelessWidget {
  final text;
  final double fontSize;

  const TextNormal( this.text, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: HexColor('#747474'),
            fontSize: fontSize),
      ),
    );
  }
}


showAlertDialog(BuildContext context, VoidCallback save) async {
  dismissDialog() {
    Navigator.of(context).pop();
  }

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      Widget cancelButton = FlatButton(
        child: Text("Không"),
        onPressed: () {
          dismissDialog();
          Navigator.of(context).pop();
        },
      );
      Widget continueButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          save();
          dismissDialog();
          Navigator.of(context).pop();
        },
      );
      AlertDialog alert = AlertDialog(
        title: Text("Tạo bài viết mới"),
        content: Text("Bạn có muốn tạo bài viết mới không?"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );

      return alert;
    },
  );
}