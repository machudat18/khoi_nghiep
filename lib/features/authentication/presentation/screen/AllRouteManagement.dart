import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/common/route/route.dart';
import 'package:khoi_nghiep/common/route/routing_contsants.dart';

class AllRouteManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khởi nghiệp',
      onGenerateRoute: generateRouteAllManagement,
      initialRoute: InsideRouteManagement,
    );
  }
}
