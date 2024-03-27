import 'package:flutter/material.dart';
import 'package:music_player/core/theme/app_colors.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: AppColor.mainGradients,
            center: Alignment.topRight,
            radius: 4.0,
          ),
        ),
        child: child,
      ),
    );
  }
}
