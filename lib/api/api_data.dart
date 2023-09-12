import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:work_graduate/models/Service.dart';
import '../models/api_list_response.dart';
import 'api_settings.dart';

class ServiceApiController {

  Future<List<Service>?> getService() async {
    var url = Uri.parse(ApiSettings.all);
    var response = await http.get(url);
    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      ApiListRespones<Service> listRespones = ApiListRespones.fromJson(jsonResponse);
      return listRespones.data;
    }
    print('manar:${ApiListRespones.fromJson(jsonDecode(response.body)).data}');
    return [];
  }
}