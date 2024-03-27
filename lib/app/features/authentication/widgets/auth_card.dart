import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/common/widgets/app_button.dart';
import 'package:music_player/app/common/widgets/app_text_button.dart';
import 'package:music_player/app/common/widgets/app_textfield.dart';
import 'package:music_player/app/features/authentication/repository/auth_repository.dart';
import 'package:music_player/core/theme/app_colors.dart';
import 'package:music_player/utils/constants/app_strings.dart';
import 'package:music_player/utils/decorations/card_decoration.dart';

enum AuthScreenMode {
  login,
  register,
}

class AuthCard extends ConsumerStatefulWidget {
  const AuthCard({super.key});

  @override
  ConsumerState<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends ConsumerState<AuthCard> {
  AuthScreenMode _screenMode = AuthScreenMode.login;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onSubmit() async {
    if (_screenMode == AuthScreenMode.login) {
      ref.read(authStateProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } else {
      ref.read(authStateProvider.notifier).register(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 90 / 100,
      decoration: cardDecoration(),
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   AppStrings.login,
              //   style: Theme.of(context).textTheme.displayLarge,
              // ),
              SizedBox(height: 10.h),

              AppTextField(
                label: AppStrings.email,
                leadIcon: Icons.email_outlined,
                vertGap: 6.h,
                controller: _emailController,
              ),
              AppTextField(
                label: AppStrings.password,
                leadIcon: Icons.password_outlined,
                vertGap: 6.h,
                controller: _passwordController,
              ),
              SizedBox(height: 20.h),
              AppButton(
                title: _screenMode == AuthScreenMode.login
                    ? AppStrings.login
                    : AppStrings.register,
                onPress: () {
                  onSubmit();
                },
                buttonColor: AppColor.mainGradients.first,
              ),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _screenMode == AuthScreenMode.login
                        ? AppStrings.dontHaveAccount
                        : AppStrings.alreadyAccount,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColor.black,
                        ),
                  ),
                  AppTextButton(
                    title: _screenMode == AuthScreenMode.login
                        ? AppStrings.register
                        : AppStrings.login,
                    onPress: () {
                      setState(() {
                        _screenMode = (_screenMode == AuthScreenMode.login)
                            ? AuthScreenMode.register
                            : AuthScreenMode.login;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
