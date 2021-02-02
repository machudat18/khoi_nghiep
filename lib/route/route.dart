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
    case ForgotPasswordRoute:
      return MaterialPageRoute(
        builder: (context) => ForgotPassword(),
      );
    case SignUpRoute:
      return MaterialPageRoute(
        builder: (context) => ForgotPassword(),
      );
    default :
      return null;
  }
}

Route<dynamic> generateRouteM003(RouteSettings settings,VoidCallback popCurrent) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) =>
                StepOneContainer(popCurrent: popCurrent));
        break;
      case '/step1':
        return MaterialPageRoute(
            builder: (context) => StepTwoContainer());
        break;
      case '/step2':
        return MaterialPageRoute(
            builder: (context) =>
                StepThreeContainer(popCurrent: popCurrent));

        break;
      default:
        break;
  }
}
