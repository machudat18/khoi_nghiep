import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/route/routing_contsants.dart';
import 'package:khoi_nghiep/screen/M002Login.dart';
import 'package:khoi_nghiep/screen/M003ForgotPassword.dart';
import 'package:khoi_nghiep/screen/M004SignUp.dart';

Route<dynamic> generateRouteUnAuth(RouteSettings settings) {
  switch (settings.name) {
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
        builder: (context) => SignUp(),
      );
      break;
    default :
      return null;
      break;
  }
}
