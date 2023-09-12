import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../models/User.dart';
import 'api_helper.dart';
import 'api_settings.dart';
import 'package:http/http.dart' as http;


class ApiAuthController with ApiHelper {

  Future<bool> login(BuildContext context,
      {required String email, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse['data'] as Map<String, dynamic>);
      // await SharedPrefController().save(student: student);
      showSnackBar(context, message: jsonResponse['message']);
      return true;
    } else if (response.statusCode == 400) {
      var message = jsonDecode(response.body)['message'];
      showSnackBar(context, message: message, error: true);
    }
    return false;
  }

  Future<bool> register(BuildContext context, {required User user}) async {
    var url = Uri.parse(ApiSettings.register);
    var responnse = await http.post(
        url,
        body: {
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'phone': user.phone,
        }
    );

    if (responnse.statusCode == 200) {
      showSnackBar(context, message: jsonDecode(responnse.body)['message']);
      return true;
    } else if (responnse.statusCode == 400) {
      showSnackBar(
          context, message: jsonDecode(responnse.body)['message'], error: true);
    } else {
      print('ereor:${responnse.statusCode}');
      showSnackBar(context, message: 'Something went wrong', error: true);
    }
    return false;
  }
}