import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khoi_nghiep/common/route/routing_contsants.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/pages/M002Login.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/pages/M003ForgotPassword.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/pages/M004Register.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/pages/M005Inside.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/pages/M006NewPosts.dart';

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
    case NewPostRoute:
      return MaterialPageRoute(
        builder: (context) => M006NewPost(),
      );
      break;
    default:
      return null;
      break;
  }
}
