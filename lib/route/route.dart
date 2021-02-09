import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/route/routing_contsants.dart';
import 'package:khoi_nghiep/screen/M002Login.dart';
import 'package:khoi_nghiep/screen/M003ForgotPassword.dart';
import 'package:khoi_nghiep/screen/M004Register.dart';
import 'package:khoi_nghiep/screen/M005Inside.dart';

Route<dynamic> generateRouteAllManagement(RouteSettings settings) {
  switch (settings.name) {
    case InsideRouteManagement:
      return MaterialPageRoute(
        builder: (context) => InsideManagement(),
      );
      break;
    case LoginRoute:
      return MaterialPageRoute(
        builder: (context) => Login(),
      );
      break;
    case ForgotPasswordRoute:
      return MaterialPageRoute(
        builder: (context) => ForgotPassword(),
      );
      break;
    case SignUpRoute:
      return MaterialPageRoute(
        builder: (context) => Register(),
      );
      break;
    default :
      return null;
      break;
  }
}
