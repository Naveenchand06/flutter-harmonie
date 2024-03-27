import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/common/widgets/app_background.dart';
import 'package:music_player/app/features/authentication/repository/auth_repository.dart';
import 'package:music_player/app/features/authentication/state/auth_result.dart';
import 'package:music_player/app/features/authentication/state/auth_state.dart';
import 'package:music_player/app/features/authentication/widgets/auth_card.dart';
import 'package:music_player/core/network/models/app_response_model.dart';
import 'package:music_player/core/theme/theme_provider.dart';
import 'package:music_player/utils/constants/app_strings.dart';
import 'package:music_player/utils/image_utils/image_path.dart';
import 'package:music_player/utils/image_utils/image_utils.dart';
import 'package:music_player/utils/loading/loading_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;

    ref.listen<AppResponse<AuthState>>(
      authStateProvider,
      (previous, current) async {
        if (current.result?.result == AuthResult.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Something went Wrong"),
            ),
          );
        }
        if (current.isLoading == true) {
          LoadingScreen.instance().show(
            context: context,
          );
          await Future.delayed(const Duration(microseconds: 300));
          LoadingScreen.instance()
              .show(context: context, text: AppStrings.creatingAccount);
        } else {
          LoadingScreen.instance().hide();
        }
      },
    );

    return Scaffold(
      body: AppBackground(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 20 / 100),
              GestureDetector(
                onTap: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
                child: ImageUtil.loadAssetImage(
                  path: ImagePath.logoPath,
                  height: 100,
                  width: 200,
                ),
              ),
              SizedBox(height: screenHeight * 10 / 100),
              const AuthCard(),
            ],
          ),
        ),
      ),
    );
  }
}
