
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/route/route.dart' as router;
import 'package:khoi_nghiep/route/routing_contsants.dart';
class UnAuth extends StatefulWidget {
  @override
  _UnAuthState createState() => _UnAuthState();
}

class _UnAuthState extends State<UnAuth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UnAuth',
      onGenerateRoute: router.generateRouteUnAuth,
      initialRoute: LoginRoute,
    );
  }
}
