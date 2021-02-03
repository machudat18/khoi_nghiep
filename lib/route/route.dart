import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/route/routing_contsants.dart';
import 'package:khoi_nghiep/screen/M002Login.dart';
import 'package:khoi_nghiep/screen/M003ForgotPassword.dart';

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
        builder: (context) => ForgotPassword(),
      );
      break;
    default :
      return null;
      break;
  }
}

Route<dynamic> generateRouteM003(RouteSettings settings,VoidCallback popCurrent) {
    switch (settings.name) {
      case ForgotPassword1:
      return MaterialPageRoute(
          builder: (context) => StepOneContainer(popCurrent: popCurrent));
      break;
    case ForgotPassword2:
      return MaterialPageRoute(builder: (context) => StepTwoContainer());
      break;
    case ForgotPassword3:
      return MaterialPageRoute(
          builder: (context) => StepThreeContainer(popCurrent: popCurrent));
      break;
    default:
        return null;
      break;
  }
}
