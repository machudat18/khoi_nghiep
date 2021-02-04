
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/ultils/GetColors.dart';

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
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
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
          height: 60,
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
