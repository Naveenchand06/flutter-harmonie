import 'package:flutter/material.dart';
import 'package:music_player/core/theme/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({this.color, super.key, this.height = 24, this.width = 24});

  final Color? color;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CircularProgressIndicator(
          color: color ?? AppColor.white,
        ),
      ),
    );
  }
}
