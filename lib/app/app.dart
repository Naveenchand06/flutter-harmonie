import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/features/authentication/repository/auth_repository.dart';
import 'package:music_player/app/features/authentication/screens/auth_screen.dart';
import 'package:music_player/app/features/authentication/state/auth_result.dart';
import 'package:music_player/app/features/home/screens/home_screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authResult = ref.watch(authResultStateProvider);

    if (authResult == AuthResult.success) {
      return const HomeScreen();
    } else {
      return const AuthScreen();
    }
  }
}
