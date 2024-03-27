import 'package:music_player/core/theme/app_theme_data.dart';
import 'package:music_player/main.dart';
import 'package:music_player/utils/local_storage/storage_keys.dart';

class StorageService {
  static Future<void> setTheme(String value) async {
    await prefs.setString(StorageKey.theme, value);
  }

  static String getTheme() {
    final value = prefs.getString(StorageKey.theme);
    if (value != null) {
      return value;
    } else {
      return AppThemeMode.dark.name;
    }
  }

  // ----------------------------------------------------------------

  static Future<void> setUserId(String value) async {
    await prefs.setString(StorageKey.userId, value);
  }

  static String getUserId() {
    return prefs.getString(StorageKey.userId) ?? '';
  }

  // ----------------------------------------------------------------

  static Future<void> setIsLoggedIn(bool value) async {
    await prefs.setBool(StorageKey.isLoggedIn, value);
  }

  static bool getIsLoggedIn() {
    return prefs.getBool(StorageKey.isLoggedIn) ?? false;
  }
}
