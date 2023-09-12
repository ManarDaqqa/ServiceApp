import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:work_graduate/api/api_helper.dart';
import 'package:work_graduate/models/Order.dart';
import 'api_settings.dart';

class ApiOrderController with ApiHelper {

  Future<bool> createOrder(BuildContext context, {required Order order,required PhotoOrder photoOrder}) async {
    var url = Uri.parse(ApiSettings.createOrder);
    var responnse = await http.post(
        url,
        body: json.encode(
            {
              'details': order.details,
              'details_address': order.detailsAddress,
              'phone': order.phone,
              'lat': order.lat,
              'long': order.long,
              'photo_order': [
                {
                  'photo': photoOrder.photo
                }
              ]
            }
        )
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