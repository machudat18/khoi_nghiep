import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/route/route.dart' as router;
import 'package:khoi_nghiep/route/routing_contsants.dart';
import 'package:khoi_nghiep/screen/M005Inside.dart';
class AllRouteManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khởi nghiệp',
      onGenerateRoute: router.generateRouteAllManagement,
      initialRoute: InsideRouteManagement,
    );
  }
}
