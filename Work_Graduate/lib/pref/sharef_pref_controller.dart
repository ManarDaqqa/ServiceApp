import 'package:shared_preferences/shared_preferences.dart';


enum PrefKey {
  language
}
class SharedPrefController {
  static final SharedPrefController _instanc = SharedPrefController._internal();
  late SharedPreferences _sharedPreferences;
  SharedPrefController._internal();

  factory SharedPrefController() {
    return _instanc;
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }


  T? getValueFor<T> ({required String key}) {
    return _sharedPreferences.get(key) as T;
  }


  Future<bool> changeLanguage(String language) async{
    return await _sharedPreferences.setString(PrefKey.language.toString(), language);
  }

  String get language => _sharedPreferences.getString(PrefKey.language.toString()) ?? 'en';
  Future<bool> clear() async{
    return await _sharedPreferences.clear();
  }
}