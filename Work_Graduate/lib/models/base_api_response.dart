

class BaseApiResponse {
  int? code;
  bool? success;
  String? message;



  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    }
  }

