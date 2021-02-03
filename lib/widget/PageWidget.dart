
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final String _uriImg, _title, _description;
  PageWidget(this._uriImg, this._title, this._description);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            child: new Image.asset('$_uriImg'),
            margin: const EdgeInsets.only(bottom: 60),
          ),
          Text(
            '$_title',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$_description',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
