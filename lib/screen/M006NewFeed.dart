import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/route/routing_contsants.dart';
import 'package:khoi_nghiep/service/storage.dart';
import 'package:khoi_nghiep/ultils/GetColors.dart';

class NewFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StorageService().getAllPosts();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: HexColor('9C9C9C'),
          ),
          title: TextField(
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.blueAccent,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Tìm kiếm",
                  border: InputBorder.none)),
        ),
        body: ListView(
          children: [
            NewTopicWidget(),

          ],
        ),
      ),
    );
  }
}

class NewTopicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NewPostRoute);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/avatar.jpg'),
                backgroundColor: Colors.black,
              ),
              Text(
                'Bạn đang nghĩ gì',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: HexColor('9C9C9C')),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
