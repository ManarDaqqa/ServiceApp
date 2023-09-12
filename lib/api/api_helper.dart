import 'dart:io';

import 'package:flutter/material.dart';
import '../models/User.dart';

mixin ApiHelper{
late String token;
  void showSnackBar(BuildContext context,{required String message,bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: Duration(seconds: 1),
      ),
    );
  }

  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  User get user {
    User user = User();
    user.token= token;
    return user;
  }
}
