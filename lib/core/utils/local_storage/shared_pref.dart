import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences pref;

  static initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }

 

 
 static setToken(String key, String value) async {
    await pref.setString(key, value);
  }
 
 static getToken(String key) async {
    return  pref.getString(key);
  }
 static removeToken(String key) async {
    await pref.remove(key);
  }
   static setUserId(String key, int value) async {
    await pref.setInt(key, value);
  }
 
 static getUserId(String key) async {
    return pref.getInt(key);
  }
 static removeUserId(String key) async {
    await pref.remove(key);
  }
}
