import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static String userLoggedInKey = 'ISLOGGEDIN';
  static String userNameKey = 'NAMEKEY';
  static String userImageKey = "PHOTOKEY";
  static String userEmailKey = 'EMAILKEY';

  // set
  static Future<bool> savedUserLoggedIn(bool isUserLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> savedUserName(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userLoggedInKey, userName);
  }

  static Future<bool> savedUserImage(String userImage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userImageKey, userImage);
  }

  static Future<void> savedUserEmail(String userEmail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmailKey, userEmail);
  }
  // get

  static Future<bool> getUserLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey);
  }

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  static Future<String> getUserImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userImageKey);
  }

  static Future<String> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  static void setSharedPreferences(User user) {
    SaveData.savedUserImage(user.photoUrl);
    //SaveData.savedUserName(user.displayName);
    SaveData.savedUserEmail(user.emailId);
    SaveData.savedUserLoggedIn(true);
  }
}
