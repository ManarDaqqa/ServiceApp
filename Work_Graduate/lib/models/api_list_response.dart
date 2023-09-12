import 'package:work_graduate/models/Service.dart';
import 'package:work_graduate/models/User.dart';
import 'base_api_response.dart';

class ApiListRespones<T> extends BaseApiResponse{
  late List<T>? data;


  ApiListRespones.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['data'] != null) {
      data = <T>[];
      if(T == Service){
        json['data'].forEach((v) {
          data!.add( Service.fromJson(v) as T);
        });
      }else if(T == User){
        json['data'].forEach((v) {
          data!.add( User.fromJson(v) as T);
        });
      }

    }
  }

}