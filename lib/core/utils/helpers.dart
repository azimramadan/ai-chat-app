import 'package:ai_chat_app/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelpers {
  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstants.firstLaunchKey) ?? true;
  }

  static Future<void> setFirstLaunchCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.firstLaunchKey, false);
  }
}
