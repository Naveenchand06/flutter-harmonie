import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/app/common/widgets/app_text_button.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.onPress,
  });

  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Something went wrong!'),
          SizedBox(height: 6.h),
          AppTextButton(
            title: 'Try Again',
            onPress: onPress ?? () {},
          )
        ],
      ),
    );
  }
}
