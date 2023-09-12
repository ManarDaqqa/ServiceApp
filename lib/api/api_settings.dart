

class ApiSettings {

  static const String _baseUrl ="https://studentucas.awamr.com/";
  static const String _baseApiUrl = "${_baseUrl}api/" ;


  static const String all = '${_baseApiUrl}all/works';
  static const String login = '${_baseApiUrl}auth/login/user';
  static const String register = '${_baseApiUrl}auth/register/user';
  static const String createOrder = '${_baseApiUrl}create/order';

}

