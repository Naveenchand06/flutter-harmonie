import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/core/theme/app_theme_data.dart';
import 'package:music_player/utils/local_storage/storage_service.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, AppThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppThemeMode> {
  ThemeNotifier() : super(AppThemeMode.light) {
    log('The Theme is ===> ${StorageService.getTheme()}');
    state = StorageService.getTheme() == AppThemeMode.dark.name
        ? AppThemeMode.dark
        : AppThemeMode.light;
  }

  Future<void> toggleTheme() async {
    state = state.opposite();
    await StorageService.setTheme(state.name);
  }
}
