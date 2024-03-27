import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/app.dart';
import 'package:music_player/core/theme/app_theme_data.dart';
import 'package:music_player/core/theme/theme_provider.dart';
import 'package:music_player/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

// * Initial App Setup
Future<void> appSetup() async {
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appSetup();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 800),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Music Player",
        theme: ref.watch(themeProvider) == AppThemeMode.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
        home: const App(),
      ),
    );
  }
}
